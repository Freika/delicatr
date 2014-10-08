require File.expand_path('../../../config/environment',  __FILE__)

loop do
  Blog.get_blogs_posts
  Rails.logger.info "Схватил последние посты в #{Time.now}.\n"
  sleep 300
end