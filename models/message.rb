# Message model
class Message < ActiveRecord::Base
  belongs_to :user

  validates :text, length: { maximum: 140 }
  validates_presence_of :text, :user

  scope :timeline_from, lambda { |user|
    where(user_id: user.id).or(Message.where(user: user.following))
                           .order(created_at: :desc)
  }
end
