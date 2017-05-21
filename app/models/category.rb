class Category < ApplicationRecord
  has_many :pins 
  has_many :users, through: :pins 

  validates :name, length: {minimum: 2}
  validates :name, uniqueness: true 
end
