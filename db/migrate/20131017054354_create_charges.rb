class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :rate
      t.references :lot, index: true
      t.timestamps
    end
  end
end
