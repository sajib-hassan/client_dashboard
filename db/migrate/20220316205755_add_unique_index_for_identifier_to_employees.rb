class AddUniqueIndexForIdentifierToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_index :employees, :identifier, unique: true if column_exists? :employees, :identifier
  end
end
