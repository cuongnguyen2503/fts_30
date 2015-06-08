class AddLevelToExam < ActiveRecord::Migration
  def change
    add_column :exams, :level, :integer
  end
end
