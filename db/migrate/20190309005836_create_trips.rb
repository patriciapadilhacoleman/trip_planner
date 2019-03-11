class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :beg_date
      t.string :end_date
      t.string :budget
      t.integer :traveler_id
    end
  end
end
