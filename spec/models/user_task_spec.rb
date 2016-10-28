require "rails_helper"

RSpec.describe UserTask, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :task}
    it {is_expected.to belong_to :user_subject}
  end
end
