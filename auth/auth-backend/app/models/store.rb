class Store < ApplicationRecord
  belongs_to :company
  has_many :wait_times

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  def self.get_nearby_locations(coords)
    byebug

    types = ['store', 'restaurant', "meal_takeaway", "meal_delivery", "cafe", "post_office", "department_store", "grocery_or_supermarket", "food", "bakery"]
    url = `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{coords[0]},#{coords[1]}&radius=1000&type=store&key=AIzaSyBSoWCOrCMX322fsHiGQat8kbEGlaedI1E`
    RestClient.get(url)
  end

end
