json.array!(@feed_entries) do |feed_entry|
  json.extract! feed_entry, :id, :name, :summary, :url, :published_at, :guid
  json.url feed_entry_url(feed_entry, format: :json)
end
