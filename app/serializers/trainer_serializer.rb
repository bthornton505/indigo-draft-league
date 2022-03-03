class TrainerSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :email, :created_at
end
