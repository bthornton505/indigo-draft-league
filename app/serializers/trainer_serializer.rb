class TrainerSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :email, :total_wins, :total_losses, :created_at
end
