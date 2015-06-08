class AddResultIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :result_id, :integer
  end
end
