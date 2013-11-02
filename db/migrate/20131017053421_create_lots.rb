class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :unitnum
      t.string :zip
      t.integer :maxtime
      t.references :merchant, index: true
      t.timestamps
    end
  end
end
