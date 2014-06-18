Spree::Taxonomy.class_eval do
  belongs_to :store

  scope :for_store, ->(store) do
    where(store_id: store.id)
  end
end
