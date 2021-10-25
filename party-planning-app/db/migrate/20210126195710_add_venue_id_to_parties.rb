class AddVenueIdToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :venue_id, :integer
  end
end
