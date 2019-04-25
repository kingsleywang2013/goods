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
end
