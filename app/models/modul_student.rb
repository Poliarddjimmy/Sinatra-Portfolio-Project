class ModulStudents < ActiveRecord::Base
  belongs_to :student
  belongs_to :modul
end
