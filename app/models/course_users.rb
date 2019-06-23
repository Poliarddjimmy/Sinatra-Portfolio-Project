class CourseUser < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :course, dependent: :destroy
end
