class Presentation < ApplicationRecord
  belongs_to :user
  has_many :polls, dependent: :destroy
  validates :title, presence: true
end
