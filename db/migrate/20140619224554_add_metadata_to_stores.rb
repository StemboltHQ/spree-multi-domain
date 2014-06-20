class AddMetadataToStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :seo_title, :string
    add_column :spree_stores, :meta_keywords, :string
    add_column :spree_stores, :meta_description, :string
  end
end
