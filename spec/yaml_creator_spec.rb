require 'spec_helper'
require 'yaml'

describe YamlCreator do

  let(:filepath) { 'C:\GitHub\test.yml' }
  let(:simple_array) { ["a", "b", "c"] }
  let(:simple_hash) { {a: "value_a", b: "value_b", c: "value_c"} }
  let(:simple_result_hash) { {"a" => "value_a", "b" => "value_b", "c" => "value_c"} }

  it 'has a version number' do
    expect(YamlCreator::VERSION).not_to be nil
  end

  it 'from array test, without enclosure' do

    YamlCreator.from_array(filepath, simple_array)
    expect(File.exist?(filepath)). to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_array
    File.delete(filepath)
  end

  it 'from array test, with enclosure' do

    YamlCreator.from_array(filepath, simple_array, '"')
    expect(File.exist?(filepath)). to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_array
    File.delete(filepath)
  end

  it 'from hash test, without enclosure' do

    YamlCreator.from_hash(filepath, simple_hash)
    expect(File.exist?(filepath)). to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_result_hash
    File.delete(filepath)
  end

  it 'from hash test, with enclosure' do

    YamlCreator.from_hash(filepath, simple_hash, '"')
    expect(File.exist?(filepath)). to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_result_hash
    File.delete(filepath)
  end
end
