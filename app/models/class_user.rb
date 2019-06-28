class ClassUser < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :class_romm, dependent: :destroy
end
