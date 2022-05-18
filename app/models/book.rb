class Book < ApplicationRecord
  belongs_to :store
  validates_presence_of :name, :stock, :store_id
end
