class CreateGpspoints < ActiveRecord::Migration
  def change
    create_table :gpspoints do |t|
      t.string :latitude
      t.string :longitude
      t.integer :num_sats
      t.float :hdofp
      t.float :altitude
      t.float :hofgae
      t.float :speed_km
      t.float :speed_mph
      t.float :angle
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
