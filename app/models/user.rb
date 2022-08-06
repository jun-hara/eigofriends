class User < ApplicationRecord
  has_secure_password
  has_many :comments

  validates :username, presence: true, uniqueness: true,
    format: { with: /\A[^\W]+\z/, message: "must not contain symbols or spaces"}
  validates :email, presence: true, uniqueness: true,
    format: { with: /\A[^@\s]+@[^@\s\.]+\.[^@\s\.]+\z/, message: "must be a valid email address"}

  def teacher?
    user_type == "teacher"
  end
end
