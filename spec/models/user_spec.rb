require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create :user}
  subject {user}

  context "associations" do
    it {expect have_many :activities}
    it {expect have_many :user_courses}
    it {expect have_many :courses}
    it {expect have_many :user_subjects}
    it {expect have_many :subjects}
  end

  context "validates" do
    it "create is valid" do
      is_expected.to be_valid
    end

    it {expect validate_presence_of :name}
    it {expect validate_presence_of :email}
    it {expect validate_presence_of :encrypted_password}

    it "name is too long" do
      subject.name = Faker::Lorem.characters(51)
      is_expected.not_to be_valid
    end

    it "email not valid" do
      subject.email = "test"
      is_expected.not_to be_valid
    end

    it "password is short" do
      subject.password = "123", subject.password_confirmation = "123"
      is_expected.not_to be_valid
    end

    it "password not matching" do
      subject.password = "123456"
      subject.password_confirmation = "123123"
      is_expected.not_to be_valid
    end
  end
end
