class User < ApplicationRecord
  has_secure_password

  has_many :legated_observations, class_name: "Observation", foreign_key: "legator_id"
  has_many :determined_observations, class_name: "Observation", foreign_key: "determinator_id"
  belongs_to :role, optional: true
  has_many :comments

  validates :username, :email, presence: true
  validates :email, uniqueness: true

  def is_admin?
    role.present? && role.name.downcase == "admin"
  end

  def is_moderator?
    role.present? && role.name.downcase == "moderator"
  end
end
