class Info < ApplicationRecord
    has_one :message
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    accepts_nested_attributes_for :message
end
