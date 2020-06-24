class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.new(invitor_id: current_user.id, invitee_id: user.id)
    
        if @friendship.save
          redirect_to users_path, notice: 'You invited to be a friend.'
        else
          redirect_to users_path, alert: 'You cannot invite the user.'
        end
      end
end
