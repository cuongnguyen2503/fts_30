class AddOptionIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :option_id, :integer
  end
end
