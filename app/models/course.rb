class Course < ApplicationRecord
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :course_subjects
  has_many :subjects, through: :course_subjects

  enum status: {pending: 0, started: 1, finished: 2}

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validates :start_date, presence: true
  validates :end_date, presence: true
end
