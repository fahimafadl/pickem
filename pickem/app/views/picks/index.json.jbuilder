json.array!(@picks) do |pick|
  json.extract! pick, :id
  json.url pick_url(pick, format: :json)
end
