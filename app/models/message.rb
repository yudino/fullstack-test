class Message < ApplicationRecord
  belongs_to :info
  validates :review, presence: true
end
