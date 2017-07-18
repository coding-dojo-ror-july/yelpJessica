class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :stars, presence: true
end   
