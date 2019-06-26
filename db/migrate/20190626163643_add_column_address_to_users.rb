class AddColumnAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :srting
  end
end
