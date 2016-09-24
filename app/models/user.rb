class User < ApplicationRecord
  attr_accessor :password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true

  before_save :encrypt_password
  after_save :clear_password

  def self.authenticate(email,login_password)
    user = User.where(email: email).first
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password)
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
  
  private

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
