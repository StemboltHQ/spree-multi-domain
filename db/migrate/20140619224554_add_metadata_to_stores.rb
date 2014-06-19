class AddMetadataToStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :default_seo_title, :string
    add_column :spree_stores, :default_meta_keywords, :string
    add_column :spree_stores, :default_meta_description, :string
    add_column :spree_stores, :site_url, :string
  end
end
