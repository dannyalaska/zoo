class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates :username, presence: true, length: {maximum: 50}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: {minimum: 6}

  has_secure_password
end
