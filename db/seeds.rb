# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Settings.subjects.each do |name|
  Subject.create! name: name
end

subjects = Subject.all
subjects.each do |subject|
  30.times do
    content = Faker::Lorem.sentence(4)
    num = rand(5)
    level = num % 2 == 0 ? 0 : 1
    question = subject.questions.build content: content,
      level: level, types: 0
    4.times do |n|
      content = Faker::Lorem.sentence(1)
      correct = n == 1 ? true : false
      question.options.build content: content, correct: correct
    end
    question.save!
  end

  30.times do
    content = Faker::Lorem.sentence(4)
    num = rand(5)
    level = num % 2 == 0 ? 0 : 1
    question = subject.questions.build content: content,
      level: level, types: 1
    4.times do
      m = rand(5)
      content = Faker::Lorem.sentence(1)
      correct = m % 2 == 0 ? true : false
      question.options.build content: content, correct: correct
    end
    question.save!
  end  

  30.times do
    content = Faker::Lorem.sentence(4)
    answer = Faker::Lorem.sentence(2)
    num = rand(5)
    level = num % 2 == 0 ? 0 : 1
    question = subject.questions.build content: content, answer: answer, 
      level: level, types: 2    
    question.save!
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