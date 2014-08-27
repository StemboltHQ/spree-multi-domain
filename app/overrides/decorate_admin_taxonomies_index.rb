Deface::Override.new(
  virtual_path: "spree/admin/taxonomies/_list",
  name: "show_store_on_admin_taxonomies_thead",
  insert_before: 'th.actions',
  text: "<th><%= Spree.t(:store) %></th>"
)

Deface::Override.new(
  virtual_path: "spree/admin/taxonomies/_list",
  name: "show_store_on_admin_taxonomies_tbody",
  insert_before: 'td.actions',
  text: "<td class='align-center'><%= taxonomy.store.try!(:name) %></td>"
)

Deface::Override.new(
  virtual_path: "spree/admin/taxonomies/_list",
  name: "show_store_on_admin_taxonomies_colgroup",
  remove: 'colgroup'
)

