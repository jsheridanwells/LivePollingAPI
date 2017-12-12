class Poll < ApplicationRecord
  belongs_to :presentation
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
end
