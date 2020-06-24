module UserHelper

    def check_occurence(id)
        html = ''
        
        if Friendship.occurence_in_friendship(id,current_user.id).count > 0
            html += link_to('Accept friendship', users_path)
            html += link_to('Reject friendship', users_path)
        elsif Friendship.occurence_in_friendship2(id,current_user.id).count == 1
            html += 'Already Friends'
        elsif Friendship.occurence_in_friendship(current_user.id,id).count > 0
            html += link_to('Awaiting acceptance from user', users_path)
        else
            html += link_to('Invite ')
        end
        html.html_safe
    end

end