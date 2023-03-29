class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true
  validates :email.downcase, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates :password, length: { minimum: 8 }
  validates_confirmation_of :password

  # private

  def self.authenticate_with_credentials(email, password)
    @user = self.find_by_email(email.strip)
    @user && @user.authenticate(password) ? @user : nil
  end
end
