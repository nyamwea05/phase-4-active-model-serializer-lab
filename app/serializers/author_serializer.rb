class AuthorSerializer < ActiveModel::Serializer
  attributes :name

  has_one :profile
  has_many :posts

  def posts
    object.posts.map do |post|
      {
        title: post.title,
        short_content: truncate_content(post.content),
        tags: post.tags.map(&:name)
      }
    end
  end

  private

  def truncate_content(content)
    content.length > 40 ? "#{content[0..39]}..." : content
  end
end
