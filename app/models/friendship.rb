class Friendship < ApplicationRecord
    belongs_to :invitor, class_name: 'User'
    belongs_to :invitee, class_name: 'User'

    scope :occurence_in_friendship, ->(r,e){where(invitor: r,invitee: e)} 
end
