class AddColumnModulNumberToTableModul < ActiveRecord::Migration
  def change
    add_column :moduls, :modul_number, :integer
  end
end
