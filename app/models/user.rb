class User < ActiveRecord::Base
  attr_accessible :name

  VALID_NAME_REGEX = /[a-zA-Z" ".]+/
  validates :name, presence: true, length: { maximum: 15 }, 
            format: { with: VALID_NAME_REGEX }, uniqueness: true

end
