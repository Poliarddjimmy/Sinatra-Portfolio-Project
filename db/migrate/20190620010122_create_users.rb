class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :first_name
      u.string :last_name
      u.string :pseudo
      u.string :email
      u.string :password_digest
      u.integer :is_a_teacher
      u.integer :is_admin
      u.string :photo
      u.string :about
      u.string :address
      u.string :phone
    end
  end
end
