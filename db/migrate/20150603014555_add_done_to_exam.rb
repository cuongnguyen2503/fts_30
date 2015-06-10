class AddDoneToExam < ActiveRecord::Migration
  def change
    add_column :exams, :done, :boolean, default: false
  end
end
