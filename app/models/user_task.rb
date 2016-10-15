class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  belongs_to :user_subject
end
