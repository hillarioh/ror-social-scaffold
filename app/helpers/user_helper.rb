module UserHelper
  def check_occurence(id)
    html = ''

    if Friendship.occurence_in_friendship(id, current_user.id).count.positive?
      friend = Friendship.occurence_in_friendship(id, current_user.id).pluck(:id)
      accept_params = { id: friend[0], invitor_id: current_user.id, invitee_id: id, status: true }
      html += link_to('Accept Friendship', friendship_path(accept_params), method: :put)
      html += ' '
      reject_params = { id: friend[0], invitor_id: current_user.id, invitee_id: id, status: true }
      html += link_to('Reject friendship', friendship_path(reject_params), method: :delete)
    elsif Friendship.occurence_in_friendship2(id, current_user.id).count == 1
      html += 'Already Friends'
    elsif Friendship.occurence_in_friendship2(current_user.id, id).count == 1
      html += 'Already Friends'
    elsif Friendship.occurence_in_friendship(current_user.id, id).count.positive?
      html += 'Awaiting acceptance from user'
    else
      html += link_to('Invite', friendships_path(invitor_id: current_user.id, invitee_id: id), method: :post)
    end
    html.html_safe
  end
end
