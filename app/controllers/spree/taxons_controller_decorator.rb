Spree::TaxonsController.class_eval do
  alias_method :old_show, :show
  def show
    old_show
    @taxonomies = @taxonomies.for_store(current_store)
  end
end
