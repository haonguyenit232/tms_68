class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :user_subjects
  has_many :subjects, through: :user_subjects

  enum role: {trainee: 0, supervisor: 1, admin: 2}

  validates :name, presence: true, length: {maximum: 50}

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
