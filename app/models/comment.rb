class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_rich_text :body

  validates :body, presence: true

  def get_username
    return User.find(self.user_id).username
  end

  def owned_by_current_user?
    return (user_id == Current.user.id) unless Current.user.nil?
  end

  def replies
    replies = Comment.where(parent_id: id)
    return replies
  end

  def get_parent_comment_id
    # replies to a common parent comment should have same parent id
    return parent_id === nil ? id : parent_id
  end
end
