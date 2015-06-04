class AddTypesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :types, :integer
  end
end
