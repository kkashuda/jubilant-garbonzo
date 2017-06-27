class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :username
end
