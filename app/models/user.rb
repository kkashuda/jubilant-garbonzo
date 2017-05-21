class User < ApplicationRecord
  has_many :users
  has_many :pins 
  has_many :categories, through: :pins 

  validates :email, uniqueness: true, on: :create
  devise :omniauthable, :omniauth_providers => [:facebook]

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end
end

