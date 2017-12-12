class Item < ApplicationRecord
  belongs_to :poll, dependent: :destroy
end
