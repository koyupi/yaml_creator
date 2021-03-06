require "yaml_creator/version"
require "yaml_creator/parser"
require "json"

# yaml creator module
module YamlCreator

  # create yaml file from array(allow nest).
  # array is made flatter and is made as yaml.
  # @param [String] filepath save yaml file path
  # @param [Array] array target array
  # @param [String] enclosure enclosure character
  def self.from_array(filepath, array, enclosure="")

    # create yaml array.
    yaml_array = YamlCreator::Parser.from_array(array, enclosure)
    # save file.
    save_file(filepath, yaml_array)
  end

  # create yaml file from hash(allow nest).
  # @param [String] filepath save yaml file path
  # @param [Hash] hash target hash
  # @param [String] enclosure enclosure character
  def self.from_hash(filepath, hash, enclosure="")

    # create yaml array.
    yaml_array = YamlCreator::Parser.from_hash(hash, enclosure)
    # save file.
    save_file(filepath, yaml_array)
  end

  # create yaml file from json.
  # @param [String] filepath save yaml file path
  # @param [Json] json json
  # @param [String] enclosure enclosure character
  def self.from_json(filepath, json, enclosure="")

    # convert to hash.
    hash = JSON.parse(json)
    # create yaml array.
    yaml_array = from_hash(filepath, hash, enclosure)
    # save file.
    save_file(filepath, yaml_array)
  end

  private

  # save yaml file.
  # @param [String] filepath save yaml file path
  # @param [Array] save array
  def self.save_file(filepath, array)

    # generate filepath.
    if filepath.empty?
      filepath = generate_filepath
    end

    # write to file.
    File.open(filepath, "w") do |file|
      array.each { |value|
        file.puts(value)
      }
    end
  end

  # generate filepath.
  # @return [String] filepath
  def self.generate_filepath

    # generate yaml filename.
    time_str = Time.now.strftime("%Y%m%d%H%M%S%3N")
    "#{time_str}.yml"
  end
end
