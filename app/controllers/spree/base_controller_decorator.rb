Spree::BaseController.class_eval do
  def title
    current_store.seo_title
  end
end
