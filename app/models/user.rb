class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
  has_secure_password
end
