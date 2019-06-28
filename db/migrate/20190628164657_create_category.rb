class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |ca|
      ca.string :category_name
      ca.string :category_icon
      ca.timestamps null: false
    end
  end
end
