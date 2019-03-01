class FloralSpecies < ApplicationRecord
  has_and_belongs_to_many :habitats
  has_and_belongs_to_many :substrates

  validates :name, presence: true
end
