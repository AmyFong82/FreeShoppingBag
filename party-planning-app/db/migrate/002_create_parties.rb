class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :date
      t.string :time
      t.string :location
      t.string :organizer
      t.integer :activity_id
      t.integer :food_id
      t.integer :snack_id
      t.integer :drink_id

      t.timestamps
    end
  end
end
