class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.text :description
      t.date :date
      t.time :time
      t.string :location
      t.string :organizer
      t.integer :max_num_of_attendees
      t.integer :category_id

      t.timestamps
    end
  end
end
