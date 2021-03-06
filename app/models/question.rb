class Question < ActiveRecord::Base
  has_many :options, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :exam  
  belongs_to :subject

  validates :content, presence: true
  validates :answer, presence: true

  enum types: [:single_choice, :multiple_choices, :text]

  accepts_nested_attributes_for :options, reject_if: ->(a){a[:content].blank?}, 
    allow_destroy: true

  scope :right_answers_of, ->(question_id){where(id: question_id).first
                                           .options.where(correct: true)}
  scope :random_questions, ->(exam_level){where(level: exam_level)
    .order("RANDOM()").first Settings.num_questions_random
  }

  Settings.types.each do |type|
    define_method("is_#{type}?"){types == type}
  end
end
