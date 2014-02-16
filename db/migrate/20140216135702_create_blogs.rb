class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :blogname
      t.string :url
      t.string :favicon
      t.string :rating

      t.timestamps
    end
  end
end
