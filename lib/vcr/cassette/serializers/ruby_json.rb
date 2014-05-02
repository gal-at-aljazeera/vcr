require 'json'

module VCR
  class Cassette
    class Serializers
      # @see Psych
      # @see Syck
      # @see YAML
      module RUBY_JSON
        extend self
        extend EncodingErrorHandling
        ENCODING_ERRORS = [JSON::ParserError, ArgumentError]
        ENCODING_ERRORS << EncodingError if defined?(EncodingError)

        # The file extension to use for this serializer.
        #
        # @return [String] "json"
        def file_extension
          "json"
        end

        # Serializes the given hash using `MultiJson`.
        #
        # @param [Hash] hash the object to serialize
        # @return [String] the JSON string
        def serialize(hash)
          handle_encoding_errors do
            JSON.generate(hash)
          end
        end

        # Deserializes the given string using `MultiJson`.
        #
        # @param [String] string the JSON string
        # @return [Hash] the deserialized object
        def deserialize(string)
          handle_encoding_errors do
            JSON.parse(string)
          end
        end
      end
    end
  end
end
