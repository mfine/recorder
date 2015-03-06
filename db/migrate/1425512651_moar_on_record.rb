Sequel.migration do
  up do
    add_column :records, :device_id, :uuid, null: false
    add_column :records, :data, :json, null: false
  end

  down do
    drop_column :records, :device_id
    drop_column :records, :data
  end
end
