class User < ActiveRecord::Base
  has_many :cours
  has_many :modul_users
end
