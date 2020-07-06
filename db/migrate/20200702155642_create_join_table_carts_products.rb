class CreateJoinTableCartsProducts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :carts, :products
  end
end
