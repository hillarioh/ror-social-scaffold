class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :user
  validates_presence_of :friend

  scope :occurence_in_friendship, ->(r, e) { where(user: r, friend: e, status: false) }
  scope :occurence_in_friendship2, ->(r, e) { where(user: r, friend: e, status: true) }
  scope :posting_friend, ->(c) { where(friend: c, status: true) }
  scope :posting_user, ->(c) { where(user: c, status: true) }
end
