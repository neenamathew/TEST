class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :studentname

      t.timestamps null: false
    end
  end
end
