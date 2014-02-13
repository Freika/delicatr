class FeedEntry < ActiveRecord::Base
def self.update_from_feed(feed_url, blogid)  
  feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
    @blog_id = blogid



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

def update_feeds

  feeds = Array.new
  Blog.all(:select => "url").each do |url| #taking all urls to array
    feeds << url
  end

    end

end