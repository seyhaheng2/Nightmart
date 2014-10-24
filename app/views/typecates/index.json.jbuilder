json.array!(@typecates) do |typecate|
  json.extract! typecate, :id, :name
  json.url typecate_url(typecate, format: :json)
end
