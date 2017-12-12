class Presentation < ApplicationRecord
  belongs_to :user
  has_many :polls
end
