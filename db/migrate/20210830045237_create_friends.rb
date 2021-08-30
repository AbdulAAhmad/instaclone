class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :friend_user, null:false, foreign_key: {to_table: 'users'}
      t.integer :status
      t.timestamps
    end
  end
end
