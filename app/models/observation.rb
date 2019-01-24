class Observation < ApplicationRecord
  belongs_to :legator, class_name: "User"
  belongs_to :determinator, class_name: "User", optional: true

  validates :area, :location, :description, :observed_at, presence: true
  validates :area, :location, length: { minimum: 3, maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 2000 }

  after_create :delegate_number

  private

  def delegate_number
    next_number = Observation.count + 1
    self.update_attributes(number: next_number.to_s.rjust(6, '0'))
  end
end
