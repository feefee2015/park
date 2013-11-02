json.array!(@merchants) do |merchant|
  json.extract! merchant, 
  json.url merchant_url(merchant, format: :json)
end
