class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :coursename
      t.integer :teacher_id
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
