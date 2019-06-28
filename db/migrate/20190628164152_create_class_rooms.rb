class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |cr|
      cr.string :cr_name
      cr.string :cr_description
      cr.timestamps null: false
    end
  end
end
