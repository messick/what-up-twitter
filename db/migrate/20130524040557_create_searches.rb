class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :term
      t.datetime :last_cached_at

      t.timestamps
    end
  end
end
