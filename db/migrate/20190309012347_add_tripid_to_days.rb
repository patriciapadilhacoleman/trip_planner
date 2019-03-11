class AddTripidToDays < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :trip_id, :integer
  end
end
