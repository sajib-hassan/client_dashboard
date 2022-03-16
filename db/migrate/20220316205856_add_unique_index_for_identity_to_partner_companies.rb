class AddUniqueIndexForIdentityToPartnerCompanies < ActiveRecord::Migration[6.1]
  def change
    add_index :partner_companies, :identity, unique: true if column_exists? :partner_companies, :identity
  end
end
