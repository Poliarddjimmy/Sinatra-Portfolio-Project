class CreateCourseUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :course_users do |m|
      m.integer :user_id
      m.integer :course_id
      m.integer :status
    end
  end
end
