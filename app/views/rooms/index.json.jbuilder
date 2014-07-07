json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :limit
  json.url room_url(room, format: :json)
end
