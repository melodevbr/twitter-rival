# User model
class User < ActiveRecord::Base
  has_secure_password

  has_many :messages

  has_and_belongs_to_many :following,
                          join_table:              'following',
                          class_name:              'User',
                          foreign_key:             'follower_id',
                          association_foreign_key: 'followed_id'

  validates :email, :password, :password_confirmation, presence: true

  validates :password, confirmation: true
  validates :email,    uniqueness: true
  validates :password, length: { minimum: 8, maximum: 16 }

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def following?(user)
    following.exists?(user)
  end

  def self.oauth_authenticate(_client, email, password)
    # find the user by it email
    user = User.find_by(email: email)
    return if user.nil?

    # check the password
    user.authenticate(password)
  end
end
