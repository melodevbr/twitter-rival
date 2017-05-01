require 'spec_helper'

describe Twitter::Api::Users do
  include Rack::Test::Methods

  def app
    Twitter::App
  end

  before(:each) do
    FactoryGirl.create(:application)

    @marcus = FactoryGirl.create(:user, email:    'marcus@example.com',
                                        password: '12345678',
                                        password_confirmation: '12345678')

    @ivan = FactoryGirl.create(:user, email: 'ivan@example.com',
                                      password: '12345678',
                                      password_confirmation: '12345678')

    @hotaviano = FactoryGirl.create(:user, email: 'hotaviano@example.com',
                                           password: '12345678',
                                           password_confirmation: '12345678')
  end

  context 'when unauthenticated' do
    it 'should allow user to create a new account' do
      post '/api/v1/users/signup',  email: 'joao@example.com',
                                    password: '12345678',
                                    password_confirmation: '12345678'

      expect(User.where(email: 'joao@example.com').first).not_to be_nil
    end

    it 'should return authentication error' do
      post '/api/v1/users/signup',  email: 'joao@example.com',
                                    password: '12345678',
                                    password_confirmation: '123456789'

      expect(last_response.status).to eq(400)
    end
  end

  context 'when authenticated' do
    before(:each) do
      post '/api/v1/oauth/token',
        grant_type: 'password',
        client_id: 'a78fb1383c14c6332165bc44c1a364b38d26fc68',
        client_secret: '118a1de593252b71f178cef60ae8b6af7c484a51bead92a6671a2630b548e68e',
        username: 'hotaviano@example.com',
        password: '12345678'

      @access_token = JSON.parse(last_response.body)['access_token']
    end

    it 'should post a message' do
      expect(@access_token).not_to be_nil

      header 'Authorization', "Bearer #{@access_token}"
      post '/api/v1/users/messages', text: 'Hello there!'

      expect(JSON.parse(last_response.body)['text']).to eq('Hello there!')
    end

    it 'should validate the message sending data' do
      expect(@access_token).not_to be_nil

      header 'Authorization', "Bearer #{@access_token}"
      post '/api/v1/users/messages', text: nil

      expect(last_response.status).to eq(400)
    end

    it "should follow an user" do

      expect(@access_token).not_to be_nil

      header "Authorization", "Bearer #{@access_token}"
      post "/api/v1/users/#{@marcus.id}/follow"

      expect(JSON.parse(last_response.body)["id"]).to eq(@marcus.id)
      expect(@hotaviano.following.length).to eq(1)
    end

    it "should see timeline" do
      expect(@access_token).not_to be_nil

      header "Authorization", "Bearer #{@access_token}"
      post "/api/v1/users/#{@marcus.id}/follow"
      post "/api/v1/users/#{@ivan.id}/follow"

      FactoryGirl.create(:message, text: "Working hard", user: @hotaviano);
      FactoryGirl.create(:message, text: "Hi migos!", user: @hotaviano);
      FactoryGirl.create(:message, text: "Elixir rocks!", user: @ivan);
      FactoryGirl.create(:message, text: "Rockstar developer", user: @marcus);
      FactoryGirl.create(:message, text: "DO IT!", user: @marcus);
      FactoryGirl.create(:message, text: "Hi?", user: @hotaviano);

      get "/api/v1/users/timeline"

      expect(JSON.parse(last_response.body).length).to eq(6)
      expect(JSON.parse(last_response.body)[1]["text"]).to eq("DO IT!")
      expect(@marcus.timeline.length).to eq(2);
      expect(@ivan.timeline.length).to eq(1);
    end

  end

end
