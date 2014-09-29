namespace :blogs do

  desc "fetch all blogs' posts to database"
  task :fetch => :environment do
    Blog.get_blogs_posts
  end

end