class Blog < ActiveRecord::Base
  has_many :posts
  has_reputation :votes, source: {reputation: :votes, of: :posts},
    aggregated_by: :sum
  attr_accessible :title, :author, :link, :feed_url, :approved
  accepts_nested_attributes_for :posts

  default_scope { order(created_at: :desc) }

  def self.most_voted
    find_with_reputation(:votes, :all, {:order => 'votes DESC'}).first(5)
  end

  def self.popular
    Blog.all.sort_by(&:most_voted)
  end


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
