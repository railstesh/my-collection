require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:images) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:thumbnail_url) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
