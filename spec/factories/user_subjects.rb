FactoryGirl.define do
  factory :user_subject do
    start_date {Faker::Date.between(2.days.ago, Date.today)}
    end_date {Faker::Date.between(2.days.ago, Date.today)}
    user_course
    subject
    user
  end
end
