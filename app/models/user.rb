class User < ApplicationRecord
  has_many :users
  has_many :pins 
  has_many :categories, through: :pins 
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
