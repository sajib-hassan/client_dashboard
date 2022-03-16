class AddUniqueIndexForCtokenToClients < ActiveRecord::Migration[6.1]
  def change
    add_index :clients, :ctoken, unique: true if column_exists? :clients, :ctoken
  end
end
