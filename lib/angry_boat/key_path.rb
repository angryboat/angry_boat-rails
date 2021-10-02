# frozen_string_literal: true

module AngryBoat
  ##
  # KeyPath provides a key path style array generation that can be used for things like dig.
  #
  # @example
  #   { 'foo' => [{ bar: :baz }] }.dig(*AngryBoat::KeyPath.normlize('foo/[0]/:bar'))
  #   # => :baz
  class KeyPath
    def self.normalize(key_path)
      key_path.split(%r{[./]}).map do |component|
        next component.gsub(/[\[|\]]/, '').to_i if component.match?(/\A\[\d+\]\z/)
        next component[1..].to_sym if component.match?(/\A:/)

        component
      end
    end
  end
end
