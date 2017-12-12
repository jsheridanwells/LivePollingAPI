class Presentation < ApplicationRecord
  belongs_to :user
  has_many :polls, dependent: :destroy
end
