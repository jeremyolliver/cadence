class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :key
      t.string :api_token
      t.boolean :public_by_default, :default => true

      t.timestamps
    end
    add_index :organisations, :key, :unique => true
    add_index :organisations, :api_token, :unique => true
  end
end
