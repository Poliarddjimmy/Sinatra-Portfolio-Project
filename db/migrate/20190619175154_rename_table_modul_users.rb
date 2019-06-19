class RenameTableModulUsers < ActiveRecord::Migration
  def change
    rename_table :modul_users, :modul_students
  end
end
