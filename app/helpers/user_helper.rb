module UserHelper

    def check_occurence(id)
        html = ''
        
        if Friendship.occurence_in_friendship(id,current_user.id).count > 0
            html += link_to('Accept frendship', users_path)
        elsif Friendship.occurence_in_friendship(current_user.id,id).count == 0
            html += link_to('Invite to frendship', users_path)
        end
        html.html_safe
    end

end