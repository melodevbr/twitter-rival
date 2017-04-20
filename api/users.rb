module Twitter::Api
  class Users < Grape::API

    namespace :users do

      # POST /api/v1/users/signup
      desc "create a new user account"
      params do
         requires :email, type: String, desc: "User's e-mail"
         requires :password, type: String, desc: "User's password"
         requires :password_confirmation, type: String, desc: "User's confirm password"
      end
      post :signup  do
        user = User.new(
          :email            => params[:email],
          :password          => params[:password],
          :password_confirmation => params[:password_confirmation],
        )

        if not user.save
          status 400
          return { :errors => user.errors }
        end

        user.as_json(only: [:id, :email])
      end

      # GET /api/v1/users/timeline
      desc "get current user timeline"
      get :timeline do
        access_token_required!
        current_resource_owner.timeline
      end

      # POST /api/v1/users/messages
      desc "create a new user message"
      params do
        requires :text, type: String, :desc => "Post's text"
      end
      post :messages do
         access_token_required!
         message = current_resource_owner.messages.new(:text => params[:text])

        if not message.save
          status 400
          return { :errors => message.errors }
        end

        message
      end

      # POST /api/v1/users/:id/follow
      route_param :id do
        desc "follow an user"
        params do
          requires :id, type: Integer, :desc => "User's id to be followed"
        end
        post :follow do
          access_token_required!
          followed = User.find(params[:id])
          current_resource_owner.following.push(followed) && current_resource_owner.save

          followed.as_json(:only => [:id, :email])
        end
      end

    end

  end
end
