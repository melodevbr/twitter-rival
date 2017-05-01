# Message model
class Message < ActiveRecord::Base
  belongs_to :user

  validates :text, length: { maximum: 140 }
  validates_presence_of :text, :user
end
