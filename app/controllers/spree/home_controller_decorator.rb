Spree::HomeController.class_eval do
  alias_method :old_index, :index
  def index
    old_index
    @taxonomies = @taxonomies.for_store(current_store)
  end
end
