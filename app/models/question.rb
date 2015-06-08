class Question < ActiveRecord::Base
  has_many :options, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :exam  
  belongs_to :subject

  enum types: [:single_choice, :multiple_choices, :text]

  accepts_nested_attributes_for :options, reject_if: ->(a){a[:content].blank?}, 
  	allow_destroy: true

end
