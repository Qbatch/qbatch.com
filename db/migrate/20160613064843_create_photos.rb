class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.references :imageable, polymorphic: true, index: true
#      t.integer :imageable_id
#      t.string  :imageable_type

      t.timestamps null: false
    end
  end
end
