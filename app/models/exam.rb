class Exam < ActiveRecord::Base
  has_many :results, dependent: :destroy
  belongs_to :user
  belongs_to :subject

  accepts_nested_attributes_for :results

  after_create :random_questions

  private
  def random_questions
    questions = self.subject.questions.where(level: self.level)
      .order("RAND()").first Settings.num_questions_random
    questions.each {|question| results.create question: question}
  end
end
