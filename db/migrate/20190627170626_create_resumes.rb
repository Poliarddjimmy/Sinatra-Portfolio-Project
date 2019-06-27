class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |r|
      r.integer :user_id
      r.string :education_shool
      r.string :education_level
      r.string :education_option
      r.string :education_end_date
      r.string :education_start_date
      r.string :skills
      r.string :languages
      r.string :company_experience
      r.string :position
      r.string :start_date
      r.string :end_date
      r.string :task
      r.string :title
    end
  end
end
