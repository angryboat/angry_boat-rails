# frozen_string_literal: true

RSpec.describe AngryBoat::KeyPath do
  describe '.normalize' do
    it 'returns an array split with .' do
      expect(described_class.normalize('foo.bar.baz')).to eq %w[foo bar baz]
    end

    it 'returns an array split with /' do
      expect(described_class.normalize('foo/bar/baz')).to eq %w[foo bar baz]
    end

    it 'converts : prefix to Symbol' do
      expect(described_class.normalize('foo/[42]/:baz')).to eq ['foo', 42, :baz]
    end

    it 'converts [\d] to integers' do
      expect(described_class.normalize('foo/[5]/baz')).to eq ['foo', 5, 'baz']
    end

    it 'converts multiple [\d] to integers' do
      expect(described_class.normalize('foo/[2000]/baz')).to eq ['foo', 2000, 'baz']
    end
  end
end
