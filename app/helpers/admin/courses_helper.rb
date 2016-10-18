module Admin::CoursesHelper

  def show_status course
    case
    when course.pending?
      t ".course_pending"
    when course.started?
      t ".course_started"
    else
      t ".course_finished"
    end
  end
end
