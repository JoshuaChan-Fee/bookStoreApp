class Book < ApplicationRecord
  belongs_to :store
  validates_presence_of :name, :stock, :store_id

  after_create_commit { broadcast_prepend_to :books }
  after_update_commit { broadcast_replace_to :books }
  after_destroy_commit { broadcast_remove_to :books }
end
