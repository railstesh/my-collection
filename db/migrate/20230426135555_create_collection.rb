class CreateCollection < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.text :description
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
