require 'pry'
class Pin < ApplicationRecord
  belongs_to :user 
  belongs_to :category
  acts_as_votable

  validates :title, length: { minimum: 5 }
  validates :title, presence: true 
  validates :description, presence: true 
  validates :link, :format => URI::regexp(%w(http https)), :allow_blank => true

  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true 

  attr_accessor :category 


    def category_attributes=(category)
      binding.pry
      self.category = Category.find_or_create_by(name: category["name"])
      self.category.update(category)
  end

end
