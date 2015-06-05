class CreateCoursestudents < ActiveRecord::Migration
  def change
    create_table :coursestudents do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
