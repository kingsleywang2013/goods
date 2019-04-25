require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
  let!(:good1) do
    Good.create(consignment_id: 'AS1001AP', name: 'TEST', type: 'test')
  end

  let!(:good2) do
    Good.create(consignment_id: 'DS1001AP', name: 'ABC', type: 'Liquid')
  end

  it 'index' do
    get :index
    expect(assigns[:goods].size).to eq 2
  end

  it 'filter by type' do
    get :index, params: { type: 'test' }
    expect(assigns[:goods].size).to eq 1
  end

  it 'filter by entry_at' do
    get :index, params: { entry_at: Time.now }
    expect(assigns[:goods].size).to eq 2
  end
end
