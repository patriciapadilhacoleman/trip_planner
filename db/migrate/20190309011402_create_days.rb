class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :location
      t.string :activities
      t.string :transportation
    end
  end
end
