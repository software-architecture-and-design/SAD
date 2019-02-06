json.extract! course, :id, :code, :title, :instructor, :semester, :created_at, :updated_at
json.url course_url(course, format: :json)
