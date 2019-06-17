class CreateModul < ActiveRecord::Migration
  def change
    create_table :moduls do |m|
      m.integer :cours_id
      m.string :modul_title
      m.string :modul_description
      m.string :modul_content
    end
  end
end
