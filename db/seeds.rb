User.create! name:  "Trainee", email: "trainee@gmail.com", password: "123456",
  password_confirmation: "123456", role: 0
User.create! name: "Supervisor", email: "supervisor@gmail.com",
  password: "123456", password_confirmation: "123456", role: 1
User.create! name: "Admin", email: "admin@gmail.com", password: "123456",
  password_confirmation: "123456", role: 2

50.times do
  name = Faker::Name.title
  description = Faker::Hacker.say_something_smart
  start_date = "2016-10-17"
  end_date = "2016-12-17"
  Course.create name: name, description: description, start_date: start_date,
    end_date: end_date
end
