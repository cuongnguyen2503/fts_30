class Question < ActiveRecord::Base
  has_many :options, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :exam  
  belongs_to :subject

  accepts_nested_attributes_for :options, reject_if: ->(a){a[:content].blank?}, allow_destroy: true

  def num_correct_answers
  	options.where(correct: 1).count
  end

end
