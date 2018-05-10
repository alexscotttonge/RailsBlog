class User < ApplicationRecord
  validates :email, presence: true,
            uniqueness: { case_sensitive: false }
  validates :name, presence: true
  has_secure_password
end
