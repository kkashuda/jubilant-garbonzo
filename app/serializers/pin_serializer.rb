class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link, :image
  has_many :comments 
  belongs_to :user
end
