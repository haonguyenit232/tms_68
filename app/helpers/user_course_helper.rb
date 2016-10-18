module UserCourseHelper
  def get_course_status object
    object.course
  end

  def show_status course
    case
    when course.pending?
      t "course.success"
    when course.started?
      t "course.primary"
    else
      t "course.info"
    end
  end
end
