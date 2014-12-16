json.array!(@pressreleases) do |pressrelease|
  json.extract! pressrelease, :id, :title, :description, :image, :date, :live
  json.url pressrelease_url(pressrelease, format: :json)
end
