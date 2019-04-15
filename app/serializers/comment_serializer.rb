class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body
  belongs_to :user
  belongs_to :observation

  attribute :username do |object|
    object.user.present? ? object.user.username : nil
  end
end
