class ModulUser < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :modul, dependent: :destroy
end
