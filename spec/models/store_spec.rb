require 'rails_helper'

RSpec.describe Store, type: :model do
  it 'has a name' do
    store = Store.new
    expect(store).to_not be_valid
    store.name = 'Test Store'
    expect(store).to be_valid
  end
end

