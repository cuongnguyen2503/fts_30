class Answer < ActiveRecord::Base
  belongs_to :result
  belongs_to :option

  accepts_nested_attributes_for :option
end
