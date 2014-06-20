module Spree
  module BaseHelper
    alias_method :old_meta_data, :meta_data
    def meta_data
      old_meta_data.merge(
        keywords: current_store.default_meta_keywords,
        description: current_store.default_meta_description
      )
    end
  end
end
