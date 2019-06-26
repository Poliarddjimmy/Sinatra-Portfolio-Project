class AddColumnTaskToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :task, :string
  end
end
