Sequel.migration do
  up do
    create_table(:books) do
      primary_key :id
      foreign_key :author_id, :authors, null: false

      column :title,       String, size: 255, null: false, unique: true
      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false
    end
  end

  down do
    drop_table(:books)
  end
end
