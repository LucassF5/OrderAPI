class AddIsLojaToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :isLoja, :boolean, :default => false
  end
end
