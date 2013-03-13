class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_secure_password

  before_save :create_remember_token

  VALID_NAME_REGEX = /[a-zA-Z" ".]+/
  validates :name, presence: true, length: { maximum: 15 }, 
            format: { with: VALID_NAME_REGEX }, uniqueness: true
  validates :password, presence: true

  private

    def create_remember_token 
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
