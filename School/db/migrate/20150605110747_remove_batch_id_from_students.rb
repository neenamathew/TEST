class RemoveBatchIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :batch_id, :string
  end
end
