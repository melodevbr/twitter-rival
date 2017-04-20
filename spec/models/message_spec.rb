require 'spec_helper'
RSpec.describe Message do

  context "when validates" do

    it { should validate_presence_of(:text) }

    it { should validate_presence_of(:user) }

    it { should validate_length_of(:text).is_at_most(140) }

  end


end
