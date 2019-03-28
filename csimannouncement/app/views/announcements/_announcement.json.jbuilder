json.extract! announcement, :id, :topic, :description, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
