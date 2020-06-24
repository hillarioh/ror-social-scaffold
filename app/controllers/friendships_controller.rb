class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.new(friendship_params)    
        if @friendship.save   
          redirect_to users_path, notice: 'You invited a user to be a friend.'
        else
          redirect_to users_path, alert: 'You cannot invite him.'
        end
      end

      private
      def friendship_params
        params.permit(:invitor_id, :invitee_id, :status)
      end
end
