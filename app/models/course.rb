class Course < ActiveRecord::Base
  belongs_to :user
  has_many :moduls
  has_many :course_users
end
