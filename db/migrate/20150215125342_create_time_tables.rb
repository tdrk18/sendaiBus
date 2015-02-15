class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.integer :dow
      t.string :routes
      t.string :destination
      t.text :time
      t.references :bus_stop, index: true

      t.timestamps null: false
    end
    add_foreign_key :time_tables, :bus_stops
  end
end
