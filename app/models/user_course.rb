class UserCourse < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects

  scope :status_of_course,->status do
    joins(:course).where "courses.status = ?", status
  end
end
