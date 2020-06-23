class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :invitor_id
      t.integer :invitee_id
      t.boolean :status , default: false

      t.timestamps
    end
  end
end
