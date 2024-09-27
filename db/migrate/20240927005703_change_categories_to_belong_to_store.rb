class ChangeCategoriesToBelongToStore < ActiveRecord::Migration[7.1]
  def change
    remove_reference :categories, :user, index: true, foreign_key: true
    add_reference :categories, :store, null: false, foreign_key: true
  end
end
