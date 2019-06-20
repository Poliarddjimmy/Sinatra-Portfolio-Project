class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |c|
      c.integer :teacher_id
      c.string :course_name
      c.string :course_description
    end
  end
end
