class CreateModulUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :modul_users do |m|
      m.integer :user_id
      m.integer :modul_id
      m.integer :status
    end
  end
end
