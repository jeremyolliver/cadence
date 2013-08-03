class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :organisation_id
      t.string :name
      t.string :key
      t.boolean :public, :default => false

      t.timestamps
    end

    add_index :projects, [:organisation_id, :key], :unique => true
  end
end
