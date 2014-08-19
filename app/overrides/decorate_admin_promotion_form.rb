Deface::Override.new(
  virtual_path: "spree/admin/promotions/_form",
  name: "add_store_select_box_to_spree_promotions",
  insert_top: ".alpha.four.columns",
  text: <<-text
  <%= f.field_container :store do %>
    <%= f.label :store_id %>
    <%= f.select :store_id, options_for_select(Spree::Store.all.map { |s| [s.name, s.id] }, selected: @promotion.store_id), {include_blank: true}, class: "fullwidth" %>
  <% end %>
  text
)
