class AddUniqueIndexForIdentityToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_index :companies, :identity, unique: true if column_exists? :companies, :identity
  end
end
