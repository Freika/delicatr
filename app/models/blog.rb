class Blog < ActiveRecord::Base
  validates :title, :author, presence: true,
    uniqueness: true
  has_many :posts

  default_scope { order(created_at: :asc) }

  def self.parse_blog(blog)
    parsed = Feedjira::Feed.fetch_and_parse(blog.feed_url)
    parsed.entries.each do |entry|
      unless Post.exists?(entry_id: entry.id)
        Post.create(title: entry.title, author: entry.author, body: entry.content,
          link: entry.url, blog_id: blog.id, entry_id: entry.entry_id)
      end
    end
  end

end
