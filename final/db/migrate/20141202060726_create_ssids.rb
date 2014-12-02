class CreateSsids < ActiveRecord::Migration
  def change
    create_table :ssids do |t|
      t.string :ssid
      t.string :bssid
      t.string :manufacture
      t.string :auth
      t.string :encryption
      t.integer :sec_type
      t.string :radio_type
      t.integer :channel
      t.string :transfer_rates
      t.string :special_transfer_rates
      t.integer :high_signal
      t.integer :high_rssi
      t.string :net_type
      t.string :label
      t.boolean :public
      t.references :user, index: true

      t.timestamps
    end
  end
end
