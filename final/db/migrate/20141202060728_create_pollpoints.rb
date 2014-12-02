class CreatePollpoints < ActiveRecord::Migration
  def change
    create_table :pollpoints do |t|
      t.references :ssid, index: true
      t.references :gps, index: true
      t.integer :signal
      t.integer :rssi

      t.timestamps
    end
  end
end
