class AddYearColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :year, :integer
  end
end
