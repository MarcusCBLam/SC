json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :short_description, :image, :live, :hidden
  json.url product_url(product, format: :json)
end
