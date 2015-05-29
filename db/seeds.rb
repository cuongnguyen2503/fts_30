# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do |n|
  subject = Subject.create!(name: Faker::Name.name)
  10.times do |m|
    question = Question.create!(content: Faker::Lorem.sentence(2), subject_id: n+1)
    4.times do |k|
      option = Option.create!(content: Faker::Lorem.sentence(2), correct: 0, question_id: m+1)
    end
  end
end 
User.create!(name:  "User admin",
             email: "admin@gmail.com",
             password:              "12345678",
             password_confirmation: "12345678",
             access_level: 1)
5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,)
end