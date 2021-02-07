class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments
  # has_many :comment_users, through: :comments, source: 'user'
  # private

  #   # アップロード画像のサイズを検証する
  #   def file_size
  #     if file.size < 10.megabytes
  #       errors.add(:picture, "should be more than 10MB")
  #     end
  #   end
end