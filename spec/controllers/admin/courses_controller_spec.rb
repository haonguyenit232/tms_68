require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  let(:admin) {FactoryGirl.create :user, :admin}
  let(:subject) {FactoryGirl.create :subject}
  before do
    sign_in admin
    @course = {
      name: "test",
      description: "this drescription",
      start_date: Faker::Time.forward(27),
      end_date: Faker::Time.forward(28),
      course_subjects_attributes: [subject_id: subject.id, _destroy: false]
    }
    @invalid_course = {name: nil}
  end

  describe "GET #new" do
    let(:course) {Course.new}
    it "new course" do
      xhr :get, :new
      expect(course).to be_a_new Course
    end
  end

  describe "POST #create" do
    it "add course after create" do
      expect {post :create, course: @course}.to change(Course, :count).by(1)
    end

    it "dont add course with invalid course" do
      expect {post :create, course: @invalid_course}
        .not_to change(Course, :count)
    end
  end
end
