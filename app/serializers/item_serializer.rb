class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_many :responses
end
