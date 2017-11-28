# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100 .times do
#   User.create({ username: Faker::RickAndMorty.character, password: "1" })
# end
lat = 40.7047945
long = -74.01322949999997

data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=bakery&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=cafe&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=supermarket&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=grocery_or_supermarket&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=food&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=store&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result["type"])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=food&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result["type"])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result["type"])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=restaurant&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result["type"])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result["type"])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=post_office&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=meal_takeaway&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=meal_delivery&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=bank&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=department_store&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub(""", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=home_goods_store&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=pharmacy&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E'))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=pet_store&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E'))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end
data = JSON.parse(RestClient.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=hospital&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E'))
data['results'].each do |result|
  a = Store.find_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
  if a
    a.update(type: a.type+" "+result['type'])
  else
    Store.create(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'], type: result['type'])
  end
end

# token = data["next_page_token"]
# i = 0
# while(!!token) do
#   puts 'start'
#   sleep(10)
#   puts 'stop'
#   url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{long}&radius=50000&type=bakery&pagetoken="+token+"&rankby=distance&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E"
#   res = RestClient.get(url)
#   newData = JSON.parse(res)
#   puts newData['results']
#   newData['results'].each do |result|
#     Store.find_or_create_by(name: result['name'], company: Company.find_or_create_by(name: result['name'].gsub("'", "")), rating: result['results'], address: result['vicinity'], latitude: result['geometry']['location']['lat'], longitude: result['geometry']['location']['lng'])
#   end
#   token = newData["next_page_token"]
#   puts token
#   puts Store.all.length
# end
