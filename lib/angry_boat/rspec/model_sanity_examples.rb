# frozen_string_literal: true

RSpec.shared_examples 'angry_boat.model_factory_sanity' do |instance_provider|
  let(:instance) do
    if instance_provider.respond_to?(:call)
      instance_provider.call
    elsif instance_provider.is_a?(Symbol) && defined?(::FactoryBot)
      FactoryBot.build(instance_provider)
    else
      class_name = instance_provider.class.name
      raise ArgumentError, "Given instance_provider #{class_name} (#{instance_provider.inspect}) is not a valid #call"
    end
  end

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
