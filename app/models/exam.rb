class Exam < ActiveRecord::Base
  has_many :questions, dependent: :destroy, through: :results
  has_many :results, dependent: :destroy
  belongs_to :user
  belongs_to :subject

  after_create :random_questions

  accepts_nested_attributes_for :results, allow_destroy: true, reject_if: :all_blank

  private    

  def random_questions
    questions = self.subject.questions.order("RAND()").first Settings.num_questions_random
    questions.each {|question| question.update_attributes exam_id: id}
  end

end
