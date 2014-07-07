json.array!(@users) do |user|
  json.extract! user, :id, :name, :icon
  json.url user_url(user, format: :json)
end
