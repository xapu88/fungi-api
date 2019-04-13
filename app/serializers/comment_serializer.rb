class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body
  belongs_to :user
  belongs_to :observation
end
