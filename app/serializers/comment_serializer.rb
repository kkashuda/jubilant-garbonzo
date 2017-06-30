class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :username, :pin_id, :created_at
  belongs_to :pin
end 
