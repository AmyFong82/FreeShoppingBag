class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
