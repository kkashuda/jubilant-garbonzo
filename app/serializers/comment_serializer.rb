class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :username, :pin_id
  belongs_to :pin
end
