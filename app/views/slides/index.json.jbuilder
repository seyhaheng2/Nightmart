json.array!(@slides) do |slide|
  json.extract! slide, :id, :name, :image, :video, :description
  json.url slide_url(slide, format: :json)
end
