class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |u|
      u.string :first_name
      u.string :last_name
      u.string :pseudo
      u.string :email
      u.string :password_digest
    end
  end
end