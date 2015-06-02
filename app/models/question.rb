class Question < ActiveRecord::Base
  has_many :options, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results
  belongs_to :subject
  
  accepts_nested_attributes_for :options, reject_if: ->(a){a[:content].blank?}, allow_destroy: true
end
