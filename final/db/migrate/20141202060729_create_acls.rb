class CreateAcls < ActiveRecord::Migration
  def change
    create_table :acls do |t|
      t.references :ssid, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
