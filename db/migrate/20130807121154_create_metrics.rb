class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :organisation_id
      t.integer :project_id, :null => false
      t.string :metric_code, :null => false
      t.float :value,        :null => false

      t.timestamps
    end
    add_index :metrics, [:project_id, :metric_code]
  end
end
