class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, length: { minimum: 4 }
    validates :username, uniqueness: { case_sensitive: false }
end
