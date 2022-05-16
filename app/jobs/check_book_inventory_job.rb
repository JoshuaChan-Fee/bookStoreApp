class CheckBookInventoryJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Book.where(stock: 0).update_all(status: "out of stock")
	Book.where("stock > ?", 0).update_all(status: nil)
  end
end
