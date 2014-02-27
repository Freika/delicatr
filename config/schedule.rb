set :environment, "production"

every 10.minutes do
	runner "Blog.parse_feeds_to_update"
end