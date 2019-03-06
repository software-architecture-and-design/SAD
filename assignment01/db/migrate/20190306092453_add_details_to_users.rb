class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :major, :string
    add_column :users, :status, :boolean
  end
end
