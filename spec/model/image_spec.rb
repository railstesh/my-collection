require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to belong_to(:collection).without_validating_presence }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:url) }

    it "is not valid without a valid URL" do
      subject.url = "google"
      expect(subject).to_not be_valid
    end
  end
end
