class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.new(friendship_params)    
        @friendship.save   
        redirect_to users_path
      end

      private
      def friendship_params
        params.permit(:invitor_id, :invitee_id, :status)
      end
end
