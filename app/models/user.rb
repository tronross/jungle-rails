class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true
  validates :email.downcase, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates_confirmation_of :password

  # validates_uniqueness_of :email.downcase

 
end
