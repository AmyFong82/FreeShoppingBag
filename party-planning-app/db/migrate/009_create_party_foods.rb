class CreatePartyFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :party_foods do |t|
      t.integer :party_id
      t.integer :food_id

      t.timestamps

    end
  end
end
