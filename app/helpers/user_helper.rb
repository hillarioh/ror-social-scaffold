module UserHelper
  def check_occurence(id)
    html = ''

    if Friendship.occurence_in_friendship(id, current_user.id).count.positive?
      friend = Friendship.occurence_in_friendship(id, current_user.id).pluck(:id)
      accept_params = { id: friend[0], user_id: current_user.id, friend_id: id, status: true }
      html += button_to('Accept Friendship', friendship_path(accept_params), id: "accept", method: :put)      
      reject_params = { id: friend[0], user_id: current_user.id, friend_id: id, status: true }
      html += button_to('Reject friendship', friendship_path(reject_params), id: "reject", method: :delete)
    elsif Friendship.occurence_in_friendship2(id, current_user.id).count == 1
      html += 'Already Friends'
    elsif Friendship.occurence_in_friendship2(current_user.id, id).count == 1
      html += 'Already Friends'
    elsif Friendship.occurence_in_friendship(current_user.id, id).count.positive?
      html += 'Awaiting acceptance from user'
    else
      html += button_to('Invite', friendships_path(user_id: current_user.id, friend_id: id),id: "invite", method: :post)
    end
    html.html_safe
  end
end
