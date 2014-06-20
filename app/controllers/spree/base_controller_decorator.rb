Spree::BaseController.class_eval do
  def default_title
    current_store.seo_title
  end
end
