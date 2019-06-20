class AddColumn < ActiveRecord::Migration
  def change
    add_column :modul_users, :status, :integer
    add_column :course_users, :status, :integer
  end
end
