class RenameTableCours < ActiveRecord::Migration
  def change
    rename_table :cours, :courses
  end
end
