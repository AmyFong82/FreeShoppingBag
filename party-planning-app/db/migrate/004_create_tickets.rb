class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :party_id
      t.integer :num_of_attendees

      t.timestamps

    end
  end
end
