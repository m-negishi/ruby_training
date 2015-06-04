class CreateCoursesTeachers < ActiveRecord::Migration
  def change
    create_table :courses_teachers, id: false do |t|
      t.references :course, index: true, null: false
      t.references :teacher, index: true, null: false

      t.timestamps null: false
    end
    # add_foreign_key(from_table, to_table)
    add_foreign_key :courses_teachers, :courses, on_delete: :cascade
    add_foreign_key :courses_teachers, :teachers, on_delete: :cascade
  end
end
