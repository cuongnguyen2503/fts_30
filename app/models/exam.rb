class Exam < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :subject

  accepts_nested_attributes_for :results

  after_create :random_questions

  scope :not_done, ->{where done: false}
  scope :expired, ->{not_done.where("created_at <= ?", Time.now - 24.hours)}

  private
  def random_questions
    questions = subject.questions.random_questions level
    questions.each {|question| results.create question: question}
  end
end
