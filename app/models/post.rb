class Post < ActiveRecord::Base
  belongs_to :blog
  attr_accessible :title, :body, :user_id, :link, :author, :blog_id, :entry_id, :creation_time
  default_scope { order(created_at: :desc) }

  has_reputation :votes, source: :user, aggregated_by: :sum

end
