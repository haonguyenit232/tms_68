class Subject < ApplicationRecord
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :tasks
  has_many :user_subjects
  has_many :users, through: :user_subjects

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
end
