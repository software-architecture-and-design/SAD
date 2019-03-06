json.extract! instructor, :id, :title, :first_name, :last_name, :email, :phone_number, :office_room, :department, :school, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
