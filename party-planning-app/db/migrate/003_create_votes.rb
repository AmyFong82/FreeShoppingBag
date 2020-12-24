class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :party_id
      t.integer :food_id
      t.integer :snack_id
      t.integer :drink_id
      t.integer :activity_id

      t.timestamps

    end
  end
end
