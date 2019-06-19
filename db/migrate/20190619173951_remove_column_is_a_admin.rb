class RemoveColumnIsAAdmin < ActiveRecord::Migration
  def change
    remove_column :users, :is_a_teacher
  end
end
