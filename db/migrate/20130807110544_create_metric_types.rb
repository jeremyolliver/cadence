class CreateMetricTypes < ActiveRecord::Migration
  def change
    create_table :metric_types do |t|
      t.string :name
      t.string :key
      t.float :min_value
      t.float :max_value
      t.string :format_prefix
      t.string :format_suffix
      t.boolean :positive, :null => false, :default => true

      t.timestamps
    end
    add_index :metric_types, :key, :unique => true
  end
end
