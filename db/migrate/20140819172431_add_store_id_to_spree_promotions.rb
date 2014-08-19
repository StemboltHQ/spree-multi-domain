class AddStoreIdToSpreePromotions < ActiveRecord::Migration
  def change
    add_reference :spree_promotions, :store, index: true
  end
end
