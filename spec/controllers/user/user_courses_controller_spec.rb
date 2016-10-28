require "rails_helper"

RSpec.describe UserCoursesController, type: :controller do
  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "render index with type is all" do
      get :index, params: {type: "all"}
    end

    it "render index with type is not all" do
      get :index, params: {type: "start"}
    end
  end

  describe "GET #show" do
    before do
      @course = FactoryGirl.create(:user_course).course
      @user_course = FactoryGirl.create(:user_course, course: @course, user: @user)
    end

    it "show all Subject on Course" do
      @subject = FactoryGirl.create(:subject)
      @user_subject = FactoryGirl.create(:user_subject, user: @user,
        user_course: @user_course, subject: @subject)
      get :show, {id: @user_course}
    end
  end
end
