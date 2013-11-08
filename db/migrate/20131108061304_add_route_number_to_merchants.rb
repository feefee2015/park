class AddRouteNumberToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :route_number, :string
  end
end
