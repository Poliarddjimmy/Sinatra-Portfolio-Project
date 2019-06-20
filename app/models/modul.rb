class Modul < ActiveRecord::Base
  belongs_to :course
  has_many :modul_users
end
