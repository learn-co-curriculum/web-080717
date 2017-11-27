class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :wait_time
end
