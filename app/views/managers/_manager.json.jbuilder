json.extract! manager, :id, :name, :email, :phone, :created_at, :updated_at
json.url manager_url(manager, format: :json)
