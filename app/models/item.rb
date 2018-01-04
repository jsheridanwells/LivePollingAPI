class Item < ApplicationRecord
  belongs_to :poll
  has_many :responses, dependent: :destroy
end
