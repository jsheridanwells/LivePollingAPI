class PollSerializer < ActiveModel::Serializer
  attributes :id, :content
  # belongs_to :presentation
  has_many :items
end
