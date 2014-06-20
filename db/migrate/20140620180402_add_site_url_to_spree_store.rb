class AddSiteUrlToSpreeStore < ActiveRecord::Migration
  def change
    add_column :spree_stores, :site_url, :string
  end
end
