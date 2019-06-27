# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

user = User.create!(username: "you_lift")

poll = Poll.create!(user_id: user.id, title: "My cool poll")

question = Question.create!(poll_id: poll.id, text: "What do you think of my neck tats?")

answer_one = AnswerChoice.create!(question_id: question.id, text: "leGM is da best")
answer_two= AnswerChoice.create!(question_id: question.id, text: "James Harden is da mVP")

response = Response.create!(user_id: user.id, answer_choice_id: answer_one.id )