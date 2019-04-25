require 'rails_helper'

RSpec.describe Good, type: :model do
  let(:good) do
    Good.create(consignment_id: 'AS1001AP', name: 'Coconuts', type: 'Food')
  end

  it 'should be valid' do
    expect(good.valid?).to eq true
  end

  it 'consignment id should not be nil' do
    good.update(consignment_id: nil)
    expect(good.invalid?).to eq true
  end

  it 'name should not be nil' do
    good.update(name: nil)
    expect(good.invalid?).to eq true
  end

  it 'type should not be nil' do
    good.update(type: nil)
    expect(good.invalid?).to eq true
  end

  it 'name should be unique' do
    good = Good.create(consignment_id: 'AS1001AP', name: 'Coconuts', type: 'Food')
    another_good = Good.create(consignment_id: 'DP1001AP', name: 'Coconuts', type: 'Food')
    expect(another_good.invalid?).to eq true
  end

  it 'create entry_at for new consignment id' do
    good = Good.create(consignment_id: 'AS1001AP', name: 'Milk', type: 'Food')
    another_good = Good.create(consignment_id: 'DP1001AP', name: 'Coconuts', type: 'Food')
    expect(good.entry_at).not_to be_nil
    expect(another_good.entry_at).not_to be_nil
  end

  it 'create exit_at for exist consignment id' do
    good = Good.create(consignment_id: 'AS1001AP', name: 'Milk', type: 'Food')
    another_good = Good.create(consignment_id: 'AS1001AP', name: 'Coconuts', type: 'Food')
    expect(good.exit_at).to be_nil
    expect(another_good.exit_at).not_to be_nil
  end
end
