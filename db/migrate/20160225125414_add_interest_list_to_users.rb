class AddInterestListToUsers < ActiveRecord::Migration
  def change
    add_column :users, :interest_list, :string
  end
end
