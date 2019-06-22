class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |c|
      c.integer :user_id
      c.string :course_name
      c.string :course_description
      c.string :photo
    end
  end
end
