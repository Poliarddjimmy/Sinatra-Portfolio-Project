class Modul < ActiveRecord::Base
  belongs_to :cours
  has_many :modul_users
end
