class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.new(friendship_params)    
        if @friendship.save   
          redirect_to users_path, notice: 'You invited a user to be a friend.'
        else
          redirect_to users_path, alert: 'You cannot invite him.'
        end
    end

    def update
        @friendship = Friendship.find(params[:id])
        if @friendship.update(friendship_params)
          flash.notice = "Friendship created"
          redirect_to users_path
        else
          flash.alert = 'Unable'
        end
    end

    def destroy
      @friendship = Friendship.find(params[:id])
      @friendship.destroy
  
      redirect_to users_path
    end

      private
      def friendship_params
        params.permit(:id,:invitor_id, :invitee_id, :status )
      end
end
