require 'csv'

path = File.join(Rails.root, 'db/data/countries.csv')
locations = []

CSV.foreach(path, headers: true) do |row|
  locations << row[0]
end

locations.each do |location|
  if !Location.exists?(name: location)
    Location.create!(name: location)
  end
end
