class AddSingleFollowingToFollowing < ActiveRecord::Migration
  def self.up
    add_index :following, %i[followed_id follower_id], unique: true
  end

  def self.down
    removed_index :following, %i[followed_id follower_id]
  end
end
