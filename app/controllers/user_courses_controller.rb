class UserCoursesController < ApplicationController
  load_and_authorize_resource

  before_action :load_course, only: :show

  def index
    type = params[:type]
    get_user_courses = current_user.user_courses
    if type == "all" || type.nil?
      @user_courses = get_user_courses
    else
      @user_courses = get_user_courses.status_of_course Course.statuses[type]
    end
  end

  def show
    @subjects = @course.subjects
    @trainer_in_course = @course.users.page params[:page]
      .per Settings.pagination.per_page_member
  end

  private
  def load_course
    @course = @user_course.course
  end
end
