Spree::BaseController.class_eval do
  def default_title
    current_store.default_seo_title
  end
end
