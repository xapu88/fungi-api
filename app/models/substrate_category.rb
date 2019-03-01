class SubstrateCategory < ApplicationRecord
  has_many :substrates

  validates :name, presence: true
end
