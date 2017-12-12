class PresentationSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :polls
end
