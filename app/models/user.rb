
require 'bcrypt'

class User < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    before_save { self.email = email.downcase }

    validates :full_name, presence: true, length: { minimum: 5 }
    validates :password, presence: true, length: { minimum: 5 }
    validates :email, presence: true, 
            format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }
    
    def password
        @password ||= BCrypt::Password.new(password_hash)
    end

    def password=(new_password)
        @password = BCrypt::Password.create(new_password)
        self.password_hash = @password
    end

end
