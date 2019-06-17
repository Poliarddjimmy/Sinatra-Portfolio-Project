class ModulUsers < ActiveRecord::Migration
  def change
    create_table :modul_users do |mu|
      mu.integer :user_id
      mu.integer :cours_id
    end
  end
end
