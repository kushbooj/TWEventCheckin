json.extract! participant, :id, :name, :email, :contact_number, :from, :event_id, :created_at, :updated_at
json.url participant_url(participant, format: :json)