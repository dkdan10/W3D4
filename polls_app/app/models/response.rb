# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :respondent_already_answered
  validate :is_author_answering

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered
    if sibling_responses.exists?(user_id: self.user_id)
      errors[:user_responded] << "User already answered this question!"
    end
  end 

  def is_author_answering
    if self.poll.user_id == self.user_id
      errors[:author_answered] << "Author can't answer!"
    end
  end



end
