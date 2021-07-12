class MessageSerializer
  include JSONAPI::Serializer
  attributes :review, :info_id
end
