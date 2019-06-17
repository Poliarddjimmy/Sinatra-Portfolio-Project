class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |c|
      c.integer :user_id
      c.string :cours_name
      c.string :cours_description
    end
  end
end
