class User < ActiveRecord::Base
  has_many :exams, dependent: :destroy

  enum access_level: [:normal, :admin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
     
end
