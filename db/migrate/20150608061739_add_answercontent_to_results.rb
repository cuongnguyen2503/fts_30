class AddAnswercontentToResults < ActiveRecord::Migration
  def change
    add_column :results, :answer_content, :string
  end
end
