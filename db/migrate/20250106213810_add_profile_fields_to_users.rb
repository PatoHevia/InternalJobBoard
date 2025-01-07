class AddProfileFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    # Agregar columnas solo si no existen
    unless column_exists?(:users, :photo)
      add_column :users, :photo, :string
    end

    unless column_exists?(:users, :bio)
      add_column :users, :bio, :text
    end

    unless column_exists?(:users, :linkedin)
      add_column :users, :linkedin, :string
    end
  end
end
