class PresentationSerializer < ActiveModel::Serializer
  attributes :id, :title, :broadcasting, :current_slide
  has_many :polls
end
