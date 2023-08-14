class AddOrganizationalSignatureToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :organizational_signature, :string
  end
end
