class Poll < ApplicationRecord
  belongs_to :presentation
  has_many :items
  accepts_nested_attributes_for :items
end
