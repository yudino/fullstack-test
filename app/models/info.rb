class Info < ApplicationRecord
    has_one :message
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    accepts_nested_attributes_for :message, update_only: true
end
