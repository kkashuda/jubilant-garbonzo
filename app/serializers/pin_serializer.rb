class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image
  has_many :comments 
  belongs_to :user
end
