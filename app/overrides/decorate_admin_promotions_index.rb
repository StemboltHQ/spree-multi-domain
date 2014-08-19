Deface::Override.new(
  virtual_path: "spree/admin/promotions/index",
  name: "add_store_search_field_to_promotions",
  insert_before: ".filter-actions",
  text: <<-text
  <div class="five columns">
    <%= label_tag nil, "store" %>
    <%= f.select :store_id_eq, options_for_select(Spree::Store.all.map { |s| [s.name, s.id] }, selected: params[:q].try!(:[], :store_id_eq)), include_blank: true %>
  </div>

  <div class="clearfix"></div>
  text
)
