Deface::Override.new(
  virtual_path: "spree/admin/orders/index",
  name: "multi_domain_admin_orders_index_search",
  insert_after: "erb[loud]:contains('search_form_for')",
  partial: "spree/admin/orders/index_search_fields",
  disabled: false
)

Deface::Override.new(
  virtual_path: "spree/admin/orders/index",
  name: "multi_domain_admin_orders_index_table_head",
  insert_top: '[data-hook="admin_orders_index_headers"]',
  text: "<th><%= sort_link @search, :store_id, Spree.t(:store) %></th>",
  disabled: false
)

Deface::Override.new(
  virtual_path: "spree/admin/orders/index",
  name: "multi_domain_admin_orders_index_table_row",
  insert_top: '[data-hook="admin_orders_index_rows"]',
  text: '<td class="align-center"><%= order.store.try(:name) %></td>',
  disabled: false
)
