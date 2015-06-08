class Result < ActiveRecord::Base
  belongs_to :question
  belongs_to :exam
  has_many :options, through: :answers
  has_many :answers

  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :options

  delegate :content, to: :question, prefix: true
  delegate :answer, to: :question, prefix: true
  delegate :content, to: :option, prefix: true
end
