class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :course_name
      t.integer :credits

      t.timestamps null: false
    end
  end
end
