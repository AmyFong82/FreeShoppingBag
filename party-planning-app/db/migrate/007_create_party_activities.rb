class CreatePartyActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :party_activities do |t|
      t.integer :party_id
      t.integer :activity_id

      t.timestamps

    end
  end
end
