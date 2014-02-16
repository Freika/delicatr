class AddFaviconToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :favicon, :string
  end
end
