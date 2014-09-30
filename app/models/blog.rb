class Blog < ActiveRecord::Base
  validates :title, :author, presence: true,
    uniqueness: true
  has_many :posts

  default_scope { order(created_at: :desc) }

  def self.get_blogs_posts
    blogs = Blog.where(approved: true)

    blogs.each do |blog|
      Blog.parse_blog(blog)
    end
  end

  private

  def self.parse_blog(blog)
    parsed = Feedjira::Feed.fetch_and_parse(blog.feed_url)
    parsed.entries.each do |entry|
      post = Post.new(title: entry.title, author: entry.author,
          body: entry.content, link: entry.url, blog_id: blog.id,
          entry_id: entry.entry_id, creation_time: entry.published)
      post.creation_time = Time.now.to_date unless entry.published == nil
      unless Post.exists?(entry_id: post.entry_id)
        post.save
      end
    end
  end

end
