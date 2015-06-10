class AddRightToResult < ActiveRecord::Migration
  def change
    add_column :results, :right, :boolean, default: false
  end
end
