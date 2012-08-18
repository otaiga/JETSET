class AddUserCountry < ActiveRecord::Migration
  def up
    add_column :users, :country, :string, :default => 44
  end

  def down
    remove_column :users, :country
  end
end
