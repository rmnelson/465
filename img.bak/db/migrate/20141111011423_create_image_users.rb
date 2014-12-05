class CreateImageUsers < ActiveRecord::Migration
  def change
    create_table :image_users do |t|
      t.references :Image, index: true
      t.references :User, index: true

      t.timestamps
    end
  end
end
