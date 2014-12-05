json.array!(@tags) do |tag|
  json.extract! tag, :id, :tag_string, :Image_id
  json.url tag_url(tag, format: :json)
end
