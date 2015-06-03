class Result < ActiveRecord::Base
  belongs_to :question
  belongs_to :exam
  belongs_to :option

  delegate :content, to: :question, prefix: true
  delegate :content, to: :option, prefix: true
end
