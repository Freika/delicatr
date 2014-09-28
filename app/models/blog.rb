class Blog < ActiveRecord::Base
  validates :title, :author, presence: true,
    uniqueness: true
  has_many :posts

  default_scope { order(created_at: :asc) }

  def self.parse_blog(blog)
    parsed = Feedjira::Feed.fetch_and_parse(blog.feed_url)

    parsed.entries.each do |entry|
      Post.create(title: entry.title, author: entry.author, body: entry.content,
        link: entry.url, blog_id: blog.id, entry_id: entry.entry_id)
    end
  end

  def update_feeds
    urls = Blog.all.pluck(:feed_url)
    feeds = Feedjira::Feed.fetch_and_parse urls
    updated_feeds = Feedjira::Feed.update(feeds.values)
    updated_feeds.each do |feed|

    end

  end
  # updated_feed = updated_feeds['http://feedjira.com/blog/feed.xml']
  # updated_feed.updated?
  # updated_feed.new_entries

  # def method_name

  # end
end
