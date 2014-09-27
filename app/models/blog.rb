class Blog < ActiveRecord::Base
  validates :title, :author, presence: true,
    uniqueness: true
  has_many :posts

  def self.parse_blog(blog)
    parsed = Feedjira::Feed.fetch_and_parse(blog.rss_link)

    parsed.entries.each do |entry|
      Post.create(title: entry.title, author: entry.author, body: entry.content,
        link: entry.url, blog_id: blog.id)
    end
  end
end
