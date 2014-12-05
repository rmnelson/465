class CreateDoiUrls < ActiveRecord::Migration
  def change
    create_table :doi_urls do |t|
      t.string :url
      t.string :name
      t.string :description
      t.references :doi, index: true

      t.timestamps
    end
  end
end
