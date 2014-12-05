json.array!(@dois) do |doi|
  json.extract! doi, :id, :doi_path
  json.url doi_url(doi, format: :json)
end
