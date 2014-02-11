class Blog < ActiveRecord::Base
before_create :parse_feed


 def parse_feed
  FeedEntry.update_from_feed(self.url)
 end
end
