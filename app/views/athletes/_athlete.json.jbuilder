json.extract! athlete, :id, :athlete_name, :gender, :class_year, :sports_id, :team_id, :position, :created_at, :updated_at
json.url athlete_url(athlete, format: :json)
