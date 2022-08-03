class PostSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :content, :category, :image_url
end
