class InfoSerializer
  include JSONAPI::Serializer
  attributes :firstname, :lastname, :email
  has_one :message
end
