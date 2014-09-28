class ChangeRssLinkToFeedUrl < ActiveRecord::Migration
  def change
    rename_column :blogs, :rss_link, :feed_url
  end
end
