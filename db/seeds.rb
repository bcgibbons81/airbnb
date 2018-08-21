# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users
user = {}
user['password'] = 'asdf'


ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['remote_avatar_url'] = "https://d2ln1xbi067hum.cloudfront.net/assets/default_user-abdf6434cda029ecd32423baac4ec238.png"

    
    
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  50.times do 
    listing['title'] = Faker::App.unique.name
    #listing['image'] Faker::LoremFlickr.image

    listing['room_type'] = ["Shared Room", "Private Room", "Entire Place"].sample
    listing['home_type'] = ["House", "Apartment", "Condominium", "Villa", "Hotel", "Other"].sample

    listing['baths'] = rand(0..5)
    listing['beds'] = rand(1..6)
    listing['max_guests'] = rand(1..10)

    listing['country'] = Faker::Address.country
    listing['tags'] = ['Close to MRT', 'Ensuite bathroom', 'Entire dwelling', 'Gym', 'Late coder', 'Non-smoking', 'Pet friendly', 'Pool', 'Smoker friendly'].sample
    listing['city'] = Faker::Address.city
    listing['postcode'] = Faker::Address.postcode
    listing['address'] = Faker::Address.street_address

    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end








