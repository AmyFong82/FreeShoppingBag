class CreateFood < ActiveRecord::Migration[6.0]
  def change
    create_table :food do |t|
      t.string :name
    end
  end
end
