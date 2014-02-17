class FeedEntry < ActiveRecord::Base
def self.update_from_feed(feed_url, blogid)  
  feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
  @blog_id = blogid
  add_entries(feed.entries)

end  

feed_url = "http://freyonrails.blogspot.com/feeds/posts/default"
blog_id = 2

def self.update_feeds 
  #@blog_id = blogid
    feeds = Blog.all.pluck(:url, :id)
    feeds.each do |url, id|  
      @blog_id = id
      feed = Feedzirra::Feed.fetch_and_parse(url)  
      add_entries(feed.entries)
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