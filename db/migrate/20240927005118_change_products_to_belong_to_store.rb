class ChangeProductsToBelongToStore < ActiveRecord::Migration[7.1]
  def change
    remove_reference :products, :user, index: true, foreign_key: true
    add_reference :products, :store, null: false, foreign_key: true
  end
end
