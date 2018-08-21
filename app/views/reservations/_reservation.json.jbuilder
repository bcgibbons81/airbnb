json.extract! reservation, :id, :user_id, :listing_id, :start_date, :end_date, :num_guests, :total, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
