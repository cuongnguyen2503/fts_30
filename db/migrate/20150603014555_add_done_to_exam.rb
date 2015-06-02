class AddDoneToExam < ActiveRecord::Migration
  def change
    add_column :exams, :done, :boolean, default: 0
  end
end
