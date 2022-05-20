class Store < ApplicationRecord
	has_many :books
	validates_presence_of :name

	after_create_commit { broadcast_prepend_to :stores }
	after_update_commit { broadcast_replace_to :stores }
	after_destroy_commit { broadcast_remove_to :stores }
end
