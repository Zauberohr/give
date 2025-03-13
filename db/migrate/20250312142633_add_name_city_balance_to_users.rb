class AddNameCityBalanceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :balance, :integer
  end
end
