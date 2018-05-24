class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :uploads

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  scope :draft, -> { where(published: false).order(created_at: :desc) }
  scope :published, -> { where(published: true) }
  scope :published_on, -> { order(published_on: :desc)}

   # def self.published_on
   #   order(published_on: :desc)
   # end
end
