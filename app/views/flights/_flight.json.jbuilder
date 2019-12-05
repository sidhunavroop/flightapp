json.extract! flight, :id, :date, :number_of_people_fit, :destination, :created_at, :updated_at
json.url flight_url(flight, format: :json)
