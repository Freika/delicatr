class AddCreationTimeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :creation_time, :string
  end
end
