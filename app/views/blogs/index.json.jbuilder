json.array!(@blogs) do |blog|
  json.extract! blog, :blogname, :url, :favicon, :rating
  json.url blog_url(blog, format: :json)
end