# yaml creator module
module YamlCreator

  # parser class.
  class Parser

    # parse yaml from array.
    # @param [Array] hash yaml array
    # @param [String] enclosure enclosure character
    # @return [Array] yaml array
    def self.from_array(array, enclosure="")

      # create yaml array
      array.map { |value|
        "- #{enclosure}#{value}#{enclosure}"
      }
    end

    # parse yaml from array.
    # array is made flatter and is made as yaml.
    # @param [Array] array target array
    # @param [String] enclosure enclosure character
    # @return [Array] yaml array
    def self.from_complex_array(array, enclosure="")

      # flatten array.
      flatten_array = array.flatten
      # create yaml array.
      from_array(flatten_array, enclosure)
    end

    # parse yaml from hash.
    # @param [Hash] hash yaml hash
    # @param [String] enclosure enclosure character
    # @return [Array] yaml array
    def self.from_hash(hash, enclosure="")

      # create yaml array
      hash.map { |key, value|
        "#{key}: #{enclosure}#{value}#{enclosure}"
      }
    end
  end
end
