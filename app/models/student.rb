class Student < ActiveRecord::Base
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :pseudo, presence: true
  validates :email, presence: true
  has_secure_password

  has_many :course_student
  has_many :modul_students

  def self.find_by_slug(slug)
    self.all.find{ |user| user.slug == slug }
  end
  def slug
    self.pseudo.gsub(" ", "-").downcase
  end

end
