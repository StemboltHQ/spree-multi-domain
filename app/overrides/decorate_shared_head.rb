Deface::Override.new(
  :virtual_path => "spree/shared/_head",
  :name => "multi_domain_canonical_url",
  :replace => "erb[loud]:contains('canonical_tag')",
  :text => "<%= canonical_tag(current_store.site_url) %>",
  :disabled => false)
