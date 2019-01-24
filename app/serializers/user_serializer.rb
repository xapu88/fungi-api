class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :full_name, :description
  has_many :legated_observations, record_type: :observation
end
