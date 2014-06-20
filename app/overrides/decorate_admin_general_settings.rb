Deface::Override.new(
  virtual_path: "spree/admin/general_settings/edit",
  name: "remove_general_settings_from_general_settings",
  disabled: false,
  remove: "fieldset.general > .field"
)
