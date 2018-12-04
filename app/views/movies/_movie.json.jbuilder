json.extract! movie, :id, :title, :year, :genre, :director, :duration, :description, :created_at, :updated_at
json.url movie_url(movie, format: :json)
