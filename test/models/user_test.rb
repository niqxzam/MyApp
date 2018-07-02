require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do

  	it "should have name and email and password_digest" do
      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:last_name).of_type(:string)      
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password).of_type(:string)
    end

    describe "validates presence and uniqueness of name and email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
    end

	describe "can be created when all attributes are present" do
		When(:user) { User.create(
		first_name: "Baz",
		last_name: "Zar",
		email: "bazzar@twitter.com",
		password: "123456",
		)}
		Then { user.valid? == true }
	end

	describe "cannot be created without a first name" do
      When(:user) { User.create(last_name: "Zar", email: "bazzar@twitter.com", password: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a last name" do
      When(:user) { User.create(first_name: "Baz", email: "bazzar@twitter.com", password: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a email" do
      When(:user) { User.create(first_name: "Baz", last_name: "Zar", password: "123456") }
      Then { user.valid? == false }
    end


    describe "cannot be created without a password" do
      When(:user) { User.create(first_name: "Baz", last_name: "Zar", email: "bazzar@twitter.com") }
      Then { user.valid? == false }
    end

    describe "should permit valid email only" do
      let(:user1) { User.create(first_name: "Tom", last_name: "Cat", email: "tom@cat.com", password: "123456")}
      let(:user2) { User.create(first_name: "Jerry", last_name: "Mouse", email: "mouse.com", password: "123456") }

      # happy_path
      it "sign up with valid email" do
        expect(user1).to be_valid
      end

      # unhappy_path
      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end
    end
  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:lists).dependent(:destroy)}
  end
end