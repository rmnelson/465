class CreateDoiBases < ActiveRecord::Migration
 def change
  create_table :doi_bases do |t|
   t.string :doi_path
  end
 end
end
