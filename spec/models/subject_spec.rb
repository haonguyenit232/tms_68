require "rails_helper"

RSpec.describe Subject, type: :model do
  let(:subject) {FactoryGirl.create :subject}

  context "associations" do
    it {expect have_many :course_subjects}
    it {expect have_many :courses}
    it {expect have_many :tasks}
    it {expect have_many :user_subjects}
    it {expect have_many :users}
    it {should accept_nested_attributes_for :tasks}
  end

  context "validates" do
    it "create is valid" do
      is_expected.to be_valid
    end

    it {expect validate_presence_of :name}
    it {expect validate_presence_of :description}

    it "description is short" do
      subject.description = Faker::Lorem.characters(9)
      is_expected.not_to be_valid
    end

    it "not have any tasks" do
      subject.task_ids = nil
      is_expected.not_to be_valid
    end
  end

  context "inprogress courses" do
    it "course is not started" do
      expect(subject.is_inprogess?).to be_falsey
    end

    it "course is started" do
      subject = FactoryGirl.create :subject,
        courses: [FactoryGirl.create(:course)]
      expect(subject.is_inprogess?).to be_truthy
    end
  end
end
