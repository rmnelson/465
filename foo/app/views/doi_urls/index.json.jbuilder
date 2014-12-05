json.array!(@doi_urls) do |doi_url|
  json.extract! doi_url, :id, :url, :name, :description, :doi_id
  json.url doi_url_url(doi_url, format: :json)
end
