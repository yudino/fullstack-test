class Message < ApplicationRecord
  belongs_to :info, inverse_of: :message
  validates :review, presence: true
end
