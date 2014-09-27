class AddLinkAndRssLinkToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :link, :string
    add_column :blogs, :rss_link, :string
  end
end
