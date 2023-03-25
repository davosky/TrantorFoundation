class AddValidatorSignatureToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :validator_signature, :string
  end
end
