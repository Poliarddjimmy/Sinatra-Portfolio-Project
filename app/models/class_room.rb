class ClassRoom < ActiveRecord::Base
  has_many :courses
  has_many :class_users
end
 
