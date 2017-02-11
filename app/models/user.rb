class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  def join_date
    created_at.getlocal.strftime("%m-%d-%Y")
  end

  def idea_count
    0
  end
end
