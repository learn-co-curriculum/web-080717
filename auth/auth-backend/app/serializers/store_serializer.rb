class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :latitude, :longitude, :rating
  has_one :company
end
