class CreateModulStudentsJoinTable < ActiveRecord::Migration
  def change
    create_table :modul_students do |m|
      m.integer :student_id
      m.integer :modul_id
    end
  end
end
