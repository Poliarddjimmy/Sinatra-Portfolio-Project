class CreateModuls < ActiveRecord::Migration
  def change
    create_table :moduls do |m|
      m.integer :course_id
      m.string :modul_title
      m.string :modul_description
      m.string :modul_content
    end
  end
end
