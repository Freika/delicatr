class AddEntryIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :entry_id, :string
  end
end
