# frozen_string_literal: true

class CommentsController < ApplicationController
  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.html { redirect_to image_url(@comment.image), notice: 'Comment was successfully added.' } if @comment.save
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :image_id)
  end
end
