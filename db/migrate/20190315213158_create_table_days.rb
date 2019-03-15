class CreateTableDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :date
      t.string :location
      t.string :activities
      t.string :transportation
      t.integer :trip_id
    end
  end
end
