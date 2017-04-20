class CreateFollowingUsers < ActiveRecord::Migration
  def self.up
  	create_table :following do |t|
  		t.references :follower, :class_name => 'User'
  		t.references :followed, :class_name => 'User'

  		t.timestamps null: false
  	end
  end

  def self.down
  	drop_table :following
  end
end
