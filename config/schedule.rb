set :environment, "development"

every 1.minutes do
	runner "Blog.test_parse"
end