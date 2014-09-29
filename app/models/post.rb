class Post < ActiveRecord::Base
  belongs_to :blog

  default_scope { order('creation_time DESC') }

end
