# frozen_string_literal: true

RSpec.shared_examples 'angry_boat.model_factory_sanity' do |instance_provider|
  let(:instance) { instance_provider.call }

  it 'provides the expected class type' do
    expect(instance).to be_a(described_class)
  end

  it 'provides an instance that passes validation' do
    expect(instance).to be_valid
  end

  it 'provides an instance that can be saved to the database' do
    expect { instance.save! }.not_to raise_error
  end
end
