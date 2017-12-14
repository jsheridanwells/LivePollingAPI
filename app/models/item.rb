class Item < ApplicationRecord
  belongs_to :poll, dependent: :destroy
  has_many :responses, dependent: :destroy
end
