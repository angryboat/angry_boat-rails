# frozen_string_literal: true

RSpec.describe AngryBoat do
  it 'has a valid version number' do
    expect(Gem::Version.new(AngryBoat::VERSION)).not_to be_nil
  end
end
