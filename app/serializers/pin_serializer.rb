class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link 
  has_many :comments 
  belongs_to :user
end
