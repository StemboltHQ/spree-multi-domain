Deface::Override.new(
  virtual_path: "spree/admin/orders/index",
  name: "multi_domain_admin_orders_index_search",
  insert_after: "erb[loud]:contains('search_form_for')",
  partial: "spree/admin/orders/index_search_fields",
  disabled: false)

