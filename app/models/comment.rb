class Comment < ApplicationRecord
  belongs_to :observation
  belongs_to :user

  validates :body, presence: true
  validates :body, length: { minimum: 3, maximum: 2000 }

end
