class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :user_course
  belongs_to :subject
  has_many :user_tasks, dependent: :destroy

  enum status: {pending: 0, started: 1, finished: 2}

  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :find_by_subject,->user_id, subject_id, user_course_id do
    find_by(user_id: user_id, subject_id: subject_id, user_course_id: user_course_id)
  end

  scope :count_status,->status, user_id do
    where(status: status, user_id: user_id).count(:status)
  end

  scope :count_subject,->user_id do
    where(user_id: user_id).count(:subject_id)
  end
end
