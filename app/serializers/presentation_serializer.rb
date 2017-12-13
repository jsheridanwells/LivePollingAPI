class PresentationSerializer < ActiveModel::Serializer
  attributes :id, :title, :broadcasting
  has_many :polls
end
