class Substrate < ApplicationRecord
  has_many :observations

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 50 }
end
