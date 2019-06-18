class Cours < ActiveRecord::Base
  belongs_to :user
  has_many :modul
end
