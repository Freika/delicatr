class Blog < ActiveRecord::Base
after_create :parse_feed
has_many :feed_entries, dependent: :destroy

 def parse_feed
  FeedEntry.update_from_feed(self.url, self.id)
 end

 def self.parse_feeds_to_update
 	FeedEntry.update_feeds
 end
 
end
