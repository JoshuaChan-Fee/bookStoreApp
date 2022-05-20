require 'rails_helper'

RSpec.describe 'Book Inventory API', type: :request do
  # initialize test data
  let!(:stores) {
    Store.create(
      [
        {name: "Indigo"},
        {name: "Chapters"}
      ]
    )
  }

  let!(:books) {
    Book.create(
      [
        { name: "Harry Potter and the Sorcerer's Stone", stock: 1, store_id: Store.first.id },
        { name: "The Lord of the Rings: The Fellowship of the Ring", stock: 0, status: "out of stock", store_id: Store.second.id }
      ]
    )
  }


  describe 'GET api/v1/book_inventory' do
    it 'returns books' do
      get api_v1_book_inventory_index_path
      expect(response).to be_successful
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
  end

  # # Test suite for GET /pokemons/:id
  describe 'GET api/v1/book_inventory/:id' do
    before { get "/api/v1/book_inventory/#{books.first.id}" }

    context 'when the record exists' do
      it 'returns the book' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(books.first.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # # Test suite for POST /pokemons
  describe 'POST api/v1/book_inventory' do
    # valid payload
    let(:valid_attributes) { 
      { book: { 
          name: 'test book', stock: 1,
          store_id: stores.first.id
        } 
      }
    }

    let(:invalid_attributes) { 
      { book: { 
          name: 'test book 2', stock: 1
        } 
      }
    }
  end
end
