class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :birthday
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :unitnum
      t.string :zip
      t.string :phone
      t.string :merchantStatus
      t.string :merchantId
      t.string :ssn
      t.string :taxId
      t.string :paymentinfo
      t.timestamps
    end
  end
end
