class CreatePartyDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :party_drinks do |t|
      t.integer :party_id
      t.integer :drink_id

      t.timestamps

    end
  end
end
