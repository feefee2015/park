class CreateParkers < ActiveRecord::Migration
  def change
    create_table :parkers do |t|
      t.string :plate
      t.string :vin
      t.datetime :start
      t.float :amountpaid
      t.string :slotid
      t.string :paymentinfo
      t.references :lot, index: true
      t.timestamps
    end
  end
end
