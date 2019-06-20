class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :first_name
      u.string :last_name
      u.string :pseudo
      u.string :email
      u.string :password_digest
      u.string :is_a_teacher
    end
  end
end
