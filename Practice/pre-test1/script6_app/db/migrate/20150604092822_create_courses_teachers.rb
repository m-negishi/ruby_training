class CreateCoursesTeachers < ActiveRecord::Migration
  def change
    create_table :courses_teachers do |t|
      t.string :course_id, null: false
      t.string :teacher_id, null: false
      t.timestamps null: false
    end
    add_index :courses_teachers, [:course_id, :teacher_id], unique: true
end
