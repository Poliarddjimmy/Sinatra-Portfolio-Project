class CreateCourseUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :course_users do |m|
      m.integer :user_id
      m.integer :course_id
    end
  end
end
