class Course < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :class_room
  belongs_to :category
  has_many :moduls, dependent: :destroy
  has_many :course_users, dependent: :destroy
end
