class AddColumnStartDateAnsEndDateToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :education_start_date, :string
    add_column :resumes, :education_end_date, :string
  end
end
