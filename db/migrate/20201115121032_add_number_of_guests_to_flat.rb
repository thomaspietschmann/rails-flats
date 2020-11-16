class AddNumberOfGuestsToFlat < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :number_of_guests, :integer
  end
end
