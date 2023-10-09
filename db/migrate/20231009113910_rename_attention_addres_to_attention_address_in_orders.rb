class RenameAttentionAddresToAttentionAddressInOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :attention_addres, :attention_address
  end
end
