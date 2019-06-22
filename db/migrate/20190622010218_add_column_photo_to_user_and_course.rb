class AddColumnPhotoToUserAndCourse < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string
    add_column :courses, :photo, :string
  end
end
