class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  belongs_to :role
 
  def admin?
    self.role.name == "admin" if !self.role.blank?
  end
  def instructor?
    self.role.name == "instructor" if !self.role.blank?
  end
  def student?
    self.role.name == "student" if !self.role.blank?
  end

end