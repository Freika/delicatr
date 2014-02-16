set :environment, "development"

every 5.minutes do
	runner "Blog.parse_feeds_to_update"
end