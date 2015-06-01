class Exam < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :user
  belongs_to :subject

  after_create :random_questions

  private    

  def random_questions
    questions = self.subject.questions.order("RAND()").first Settings.default_num_questions_random
    questions.each {|question| question.update_attributes exam_id: id}
  end

end
