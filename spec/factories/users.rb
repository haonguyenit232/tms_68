FactoryGirl.define  do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {"123456"}
    password_confirmation {"123456"}
    trait :admin do
      role 2
    end
  end

  trait :admin do
    role {User.roles[:admin]}
  end
end
