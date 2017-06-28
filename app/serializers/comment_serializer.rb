class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :username
  belongs_to :pin
end
