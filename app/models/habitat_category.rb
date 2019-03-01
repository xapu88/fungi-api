class HabitatCategory < ApplicationRecord
  has_many :habitats

  validates :name, presence: true
end
