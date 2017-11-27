class WaitTimeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :store
  has_one :user
end
