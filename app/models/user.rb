class User < ActiveRecord::Base
  has_many :exams, dependent: :destroy

  enum access_level: [:normal, :admin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :admins, ->{where access_level: 1}

  Settings.user_levels.each do |level|
    define_method("#{level}_user?") do
      access_level == level
    end
  end    
end
