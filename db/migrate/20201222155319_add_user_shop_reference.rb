class AddUserShopReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :shops, :user, index: true
  end
end
