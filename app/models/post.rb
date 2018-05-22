class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :uploads

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }
  scope :draft, -> { where(published: false) }
  scope :published, -> { where(published: true) }
end
