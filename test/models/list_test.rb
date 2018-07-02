require "rails_helper"

RSpec.describe List, type: :model do

  context "validations" do

    it "should have title and description and user_id" do
      should have_db_column(:title).of_type(:string)
      should have_db_column(:description).of_type(:text)
      should have_db_column(:user_id).of_type(:integer)
    end

    describe "validates presence of attributes" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:description) }
    end

    describe "validates length of title & description" do
      it { is_expected.to validate_length_of(:title).is_at_most(20)}
      it { is_expected.to validate_length_of(:description).is_at_most(100)}
    end
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }
  end
end
