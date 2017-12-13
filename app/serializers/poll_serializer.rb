class PollSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_many :items
end
