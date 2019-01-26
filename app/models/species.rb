class Species < ApplicationRecord
  has_many :observations

  validates :name, :genus, presence: true
end
