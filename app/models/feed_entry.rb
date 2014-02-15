class FeedEntry < ActiveRecord::Base
def self.update_from_feed(feed_url, blogid)  
  feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
  @blog_id = blogid
  add_entries(feed.entries)

end  

feed_url = "http://freyonrails.blogspot.com/feeds/posts/default"
blog_id = 2

def self.test_update 
  #@blog_id = blogid
  blogs = Blog.all.to_a
    blogs_count = blogs.count
    i = 0
    feeds = Array.new
    #feeds = ["scorched.ru/feeds/posts/default", "http://freyonrails.blogspot.com/feeds/posts/default"]
=begin
    while i <= blogs_count
      feeds << blogs[i].url
      i+=1
    end
=end

blogs.map do |blog|
  feeds << blog.url
end

    feeds.each do |url|  
      feed = Feedzirra::Feed.fetch_and_parse(url)  
      add_entries(feed.entries)
    end

end  

def self.update_feeds_continuously(delay = 10.seconds)
      
  loop do
    sleep delay
    blogs = Blog.all
    blogs_count = blogs.count
    i = 0
    feeds = Array.new
    while i <= blogs_count
      feeds << blogs[i].url
      i+=1
    end

    feeds.each do |url|
      #feed = Feedzirra::Feed.update(feed)
      add_entries(feed.entries)
    end
    feed = Feedzirra::Feed.fetch_and_parse(url)
      add_entries(feed.entries)
    #feed = Feedzirra::Feed.update(feed)
    #add_entries(feed.new_entries) if feed.updated?
  end
  
end


def update_feeds

  feeds = Array.new
  Blog.all(:select => "url").each do |url| #taking all urls to array
    feeds << url
  end

end


private 

def self.add_entries(entries)
  entries.each do |entry|
        unless exists? :guid => entry.id  
      create!(  
        :name         => entry.title,  
        :summary      => entry.content,  
        :url          => entry.url,  
        :published_at => entry.published,  
        :guid         => entry.id,
        :blog_id  => @blog_id  
      )  
    end  
end

end

end