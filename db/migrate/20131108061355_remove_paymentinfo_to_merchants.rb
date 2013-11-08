class RemovePaymentinfoToMerchants < ActiveRecord::Migration
  def change
    remove_column :merchants, :paymentinfo, :string
  end
end
