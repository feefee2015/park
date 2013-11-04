class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :status
      t.string :transactionId
      t.string :remarks
      t.references :parker, index: true

      t.timestamps
    end
  end
end
