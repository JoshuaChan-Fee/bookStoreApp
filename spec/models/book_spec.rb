require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a store to associate' do
    book = Book.new(
      name: 'test book',
      stock: 1,
    )
    expect(book).to_not be_valid
    store = Store.create(name: "test store")
    book.store_id = store.id
    expect(book).to be_valid
  end
end
