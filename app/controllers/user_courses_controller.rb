class UserCoursesController < ApplicationController

  def index
    type = params[:type]
    get_user_courses = current_user.user_courses
    if type == "all" || type.nil?
      @user_courses = get_user_courses
    else
      @user_courses = get_user_courses.status_of_course Course.statuses[type]
    end
  end
end
