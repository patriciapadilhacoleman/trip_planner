class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :dep_airport
      t.string :dep_time
      t.string :arr_airport
      t.string :arr_time
      t.string :price
      t.string :airline
      t.string :reservation
      t.integer :trip_id
    end
  end
end
