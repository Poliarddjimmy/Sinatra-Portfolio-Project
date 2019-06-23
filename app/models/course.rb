class Course < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :moduls, dependent: :destroy
  has_many :course_users, dependent: :destroy
end
