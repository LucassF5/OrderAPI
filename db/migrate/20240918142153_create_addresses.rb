class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
