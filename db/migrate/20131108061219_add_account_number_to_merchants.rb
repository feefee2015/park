class AddAccountNumberToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :account_number, :string
  end
end
