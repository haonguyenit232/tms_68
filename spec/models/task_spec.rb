require "rails_helper"

RSpec.describe Task, type: :model do

  context "association" do
    it {is_expected.to belong_to :subject}
    it {is_expected.to have_many :user_tasks}
    it {is_expected.to have_many :users}
  end

  context "validate" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:description)}
  end
end
