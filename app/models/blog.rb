class Blog < ActiveRecord::Base
after_create :parse_feed
has_many :feed_entries, dependent: :destroy

 def parse_feed
  FeedEntry.update_from_feed(self.url, self.id)
 end

 


end
