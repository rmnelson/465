class CreateDois < ActiveRecord::Migration
  def change
    create_table :dois do |t|
      t.string :doi_path

      t.timestamps
    end
  end
end
