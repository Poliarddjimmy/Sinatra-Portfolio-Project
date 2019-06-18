class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :courses, :cours
  end
end
