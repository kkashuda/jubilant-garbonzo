class Pin < ApplicationRecord
  belongs_to :user 
  belongs_to :category
  acts_as_votable

  validates :title, length: { minimum: 5 }
  validates :title, presence: true 
  validates :description, presence: true 

  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
