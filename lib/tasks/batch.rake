namespace :batch do
  desc "Checks book inventory level and update its status"
  task check_book_inventory: :environment do
  	Book.where(stock: 0).update_all(status: "out of stock")
	Book.where("stock > ?", 0).update_all(status: nil)
  end

end
