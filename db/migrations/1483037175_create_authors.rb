Sequel.migration do
  up do
    create_table(:authors) do
      primary_key :id

      column :name,       String, size: 255, null: false, unique: true
      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false
    end
  end

  down do
    drop_table(:authors)
  end
end
