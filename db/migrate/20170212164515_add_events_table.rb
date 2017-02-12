class AddEventsTable < ActiveRecord::Migration[5.0]
    create_table(:events) do |t|
      t.column :aggregate_root_uuid, :string
      t.column :aggregate_root_name, :string
      t.column :name, :string
      t.json :payload
      t.timestamps
    end
end
