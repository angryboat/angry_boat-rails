# frozen_string_literal: true

module AngryBoat
  module RSpec
    module GraphQLExampleGroup
      def execute(query, variables: {}, operation_name: nil)
        headers = self.class.metadata.fetch(:headers, {})
        headers['Content-Type'] ||= 'application/json'
        headers['Accept'] ||= 'application/json'

        params = {
          'query' => query,
          'variables' => variables,
          'operationName' => operation_name
        }

        post(self.class.metadata.fetch(:graph_path), params: JSON.dump(params), headers: headers)
      end

      def response_value(key_path)
        response.parsed_body.dig(*AngryBoat.key_path(key_path))
      end

      def self.included(klass)
        klass.subject(:response_data) { response.parsed_body.fetch('data', nil) }
        klass.subject(:response_errors) { response.parsed_body.fetch('errors', nil) }
        klass.subject { response }
      end

      def _fetch_value(using_key)
        if using_key.respond_to?(:call)
          instance_exec(&using_key)
        else
          _fetch_value(-> { send(using_key) })
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.define_derived_metadata(file_path: Regexp.new('spec[\\\/]graphql[\\\/]')) do |metadata|
    metadata[:type] = :graphql
    metadata[:graph_path] = '/graphql'
  end

  config.include(RSpec::Rails::RequestExampleGroup, type: :graphql)
  config.include(AngryBoat::RSpec::GraphQLExampleGroup, type: :graphql)
end
