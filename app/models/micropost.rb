class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  
  # has_many :favorites
  # has_many :users_fav, through: :favorites, source: :user
  # Micropost.find(1).favorites
end
