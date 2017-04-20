require 'spec_helper'

RSpec.describe User do
  
  describe "when get timeline" do


  	it "should return followed posts" do 
  		user1 = FactoryGirl.create(:user, {:email => 'a@a.com'})
  		user2 = FactoryGirl.create(:user, {:email => 'b@b.com'})

  		user1.following.push(user2)
      user1.save

      user1 = User.find(user1.id)

  		create(:message, {:user => user1})
  		create(:message, {:user => user2})

      # returns two posts
  		expect(user1.timeline.length).to eq(2)

      # posts are sorted
      expect(user1.timeline.first['user']['email']).to eq('b@b.com')
      expect(user2.timeline.length).to eq(1)
  	end

  end

end
