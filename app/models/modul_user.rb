class ModulUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :modul
end
