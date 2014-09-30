class Post < ActiveRecord::Base
  belongs_to :blog

  default_scope { order(creation_time: :desc, created_at: :desc) }

end
