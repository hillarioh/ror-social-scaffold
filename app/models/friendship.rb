class Friendship < ApplicationRecord
    belongs_to :invitor, class_name: 'User'
    belongs_to :invitee, class_name: 'User'

    validates_presence_of :invitor
    validates_presence_of :invitee

    scope :occurence_in_friendship, ->(r,e){where(invitor: r,invitee: e)} 
end
