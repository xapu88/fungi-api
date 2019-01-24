class Observation < ApplicationRecord
  belongs_to :legator, class_name: "User"
  belongs_to :determinator, class_name: "User", optional: true
end
