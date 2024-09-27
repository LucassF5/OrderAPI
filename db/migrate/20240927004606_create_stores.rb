class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.bigint :cnpj
      t.string :uf
      t.integer :cep
      t.string :razao_social
      t.string :nome_fantasia
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
