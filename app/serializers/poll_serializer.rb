class PollSerializer < ActiveModel::Serializer
  attributes :id, :content, :response_type, :feedback_type
  has_many :items
end
