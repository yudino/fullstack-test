class Info < ApplicationRecord
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    has_one :message
end
