json.extract! list, :id, :title, :description, :image, :created_at, :updated_at
json.url list_url(list, format: :json)