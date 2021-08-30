class FriendsController < ApplicationController
    def index

        @requesting_friends = Friend.where(friend_user_id: current_user, status: "pending")

        @pending_friends = Friend.where(user_id: current_user, status: "pending")

        @current_friends = Friend.where(user_id: current_user, status: "accepted")

    end
    def create()
        puts User.find params[:friend]
        puts params[:friend]
        newfriend = Friend.new(user_id:current_user.id, friend_user_id: params[:friend], status: "pending")
        puts newfriend
        if newfriend.save
            flash[:alert] = "Added"
        else
            flash[:alert] = "Didnt add"
        end
    end 

    private
    def friend_params
        params.permit(:friend)
    end
end
