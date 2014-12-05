class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_string
      t.references :Image, index: true

      t.timestamps
    end
  end
end
