class Room < ApplicationRecord

  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :posts
  has_many :entries
  
end
