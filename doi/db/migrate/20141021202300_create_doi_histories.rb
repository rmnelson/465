class CreateDoiHistories < ActiveRecord::Migration
 def change
  create_table :doi_histories do |t|
   t.string :name
   t.string :description
   t.string :url
   t.timestamp :created
   t.timestamp :updated
   t.references :doi_base, index: true
  end
 end
end
