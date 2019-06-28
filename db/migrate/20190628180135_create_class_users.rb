class CreateClassUsers < ActiveRecord::Migration
  def change
    create_table :class_users do |cu|
      cu.integer :user_id
      cu.integer :class_id
    end
  end
end
