class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject

  scope :of_course_and_subject,->course_id, subject_id do
    find_by course_id: course_id, subject_id: subject_id
  end
end
