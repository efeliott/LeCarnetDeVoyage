json.extract! trip, :id, :destination, :description, :dateDebut, :dateFin, :created_at, :updated_at
json.url trip_url(trip, format: :json)
