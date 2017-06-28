class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link 
  has_many :comments
end
