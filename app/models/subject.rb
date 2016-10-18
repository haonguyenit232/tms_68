class Subject < ApplicationRecord
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :tasks
  has_many :user_subjects
  has_many :users, through: :user_subjects
  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validate :validate_tasks

  private
  def validate_tasks
    if tasks.select{|task| !task._destroy}.count < Settings.task_quanlity
      errors.add :subjects, I18n.t("admin.subjects.task_quanlity_error")
    end
  end
end
