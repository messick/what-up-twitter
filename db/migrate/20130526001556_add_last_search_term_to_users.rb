class AddLastSearchTermToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_search_term, :string
  end
end
