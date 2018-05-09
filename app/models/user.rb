class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
end
