class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :email, presence: true,
            uniqueness: { case_sensitive: false }
  validates :name, presence: true
  has_secure_password
end
