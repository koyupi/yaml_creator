# yaml creator module
module YamlCreator

  # parser class.
  class Parser

    # parse yaml from array.
    # array is made flatter and is made as yaml.
    # @param [Array] array target array
    # @param [String] enclosure enclosure character
    # @return [Array] yaml array
    def self.from_array(array, enclosure="")

      # flatten array.
      flatten_array = array.flatten
      # create yaml array
      flatten_array.map { |value|
        "- #{enclosure}#{value}#{enclosure}"
      }
    end

    # parse yaml from hash.
    # @param [Hash] hash yaml hash
    # @param [String] enclosure enclosure character
    # @return [Array] yaml array
    def self.from_hash(hash, enclosure="")

      # create yaml array.
      yaml_from_hash(hash, "", enclosure, [])
    end

    private

    # tab string, four space.
    SPACE_FOUR = "    "

    # parse yaml from complex hash.
    # @param [Hash] hash yaml hash
    # @param [String] tab_string tab string, default space(length = 4)
    # @param [String] enclosure enclosure character
    # @param [Array] yaml array
    # @return [Array] yaml array
    def self.yaml_from_hash(hash, tab_string, enclosure, yaml_array)

      hash.each { |key, value|
        # if value is Hash
        if value.is_a?(Hash)
          # create yaml key string.
          yaml_array << tab_string + "#{key}:"
          complex_tab_string = tab_string + SPACE_FOUR
          # create yaml nest hash.
          yaml_from_hash(value, complex_tab_string, enclosure, yaml_array)
        else
          # create yaml string.
          yaml_array << tab_string + "#{key}: #{enclosure}#{value}#{enclosure}"
        end
      }

      yaml_array
    end
  end
end
