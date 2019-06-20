class CreateCourseStudentsJoinTable < ActiveRecord::Migration
  def change
    create_table :course_students do |m|
      m.integer :student_id
      m.integer :course_id
    end
  end
end
