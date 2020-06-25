module UserHelper

    def check_occurence(id)
        html = ''
        
        if Friendship.occurence_in_friendship(id,current_user.id).count > 0
            friend = Friendship.occurence_in_friendship(id,current_user.id).pluck(:id)
            html += link_to('Accept Friendship', friendship_path(:id => friend[0], :invitor_id => current_user.id, :invitee_id => id,:status =>true), method: :put)
            html += link_to('Reject friendship', users_path)
        elsif Friendship.occurence_in_friendship2(id,current_user.id).count == 1
            html += 'Already Friends'
        elsif Friendship.occurence_in_friendship2(current_user.id,id).count == 1
            html += 'Already Friends'
        elsif Friendship.occurence_in_friendship(current_user.id,id).count > 0
            html += 'Awaiting acceptance from user'
        else
            html += link_to('Invite', friendships_path(:invitor_id => current_user.id, :invitee_id => id), :method => :post)
        end
        html.html_safe
    end

end