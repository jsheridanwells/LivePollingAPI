class ItemSerializer < ActiveModel::Serializer
  attributes :id, :content, :correct
  has_many :responses
end
