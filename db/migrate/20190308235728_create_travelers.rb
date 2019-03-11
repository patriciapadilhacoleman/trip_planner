class CreateTravelers < ActiveRecord::Migration[5.1]
  def change
    create_table :travelers do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :dob
      t.string :home_airport
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
    end
  end
end
