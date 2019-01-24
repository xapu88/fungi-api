class User < ApplicationRecord
  has_secure_password

  has_many :legated_observations, class_name: "Observation", foreign_key: "legator_id"
  has_many :determined_observations, class_name: "Observation", foreign_key: "determinator_id"

  validates :username, :email, presence: true
  validates :email, uniqueness: true
end
