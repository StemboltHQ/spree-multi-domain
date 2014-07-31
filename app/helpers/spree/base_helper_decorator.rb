module Spree
  module BaseHelper
    alias_method :old_meta_data, :meta_data

    def meta_data
      # Ignore blank values
      data = old_meta_data.delete_if { |k, v| v.blank? }

      # By default, spree allows objects to override the keywords if they're defined.
      # This restores that functionality while falling back to the stores attributes.
      data.reverse_merge(
        keywords: current_store.meta_keywords,
        description: current_store.meta_description
      )
    end
  end
end
