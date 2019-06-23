class Modul < ActiveRecord::Base
  belongs_to :course, dependent: :destroy
  has_many :modul_users, dependent: :destroy
end
