class AddAnswerToResult < ActiveRecord::Migration
  def change
    add_column :results, :answer, :text
  end
end
