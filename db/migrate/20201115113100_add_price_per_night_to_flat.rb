class AddPricePerNightToFlat < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :price_per_night, :integer
  end
end
