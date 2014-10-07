class Post < ActiveRecord::Base
  belongs_to :blog
  acts_as_votable

  default_scope { order(created_at: :desc) }

end
