class ProfileSerializer < ActiveModel::Serializer
  attributes :username, :email, :bio, :avatar_url
end

# app/serializers/post_serializer.rb
class PostSerializer < ActiveModel::Serializer
  attributes :title, :content,username, :email, :bio, :avatar_url

  belongs_to :author
  has_many :tags
end