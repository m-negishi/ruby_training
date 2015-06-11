class CreateCoursesTeachers < ActiveRecord::Migration
  def change
    create_table :courses_teachers do |t|
      t.references :course, null: false
      t.references :teacher, null: false

      t.timestamps null: false
    end
    add_index :courses_teachers, [:course_id, :teacher_id], unique:true
  end
end
