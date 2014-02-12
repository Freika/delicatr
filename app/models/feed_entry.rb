class FeedEntry < ActiveRecord::Base
def self.update_from_feed(feed_url)  
  feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
    @blog_id = Blog.last.id

  feed.entries.each do |entry|  
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