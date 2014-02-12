class AddBlogidToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :blog_id, :integer
  end
end
