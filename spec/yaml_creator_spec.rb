require 'spec_helper'
require 'yaml'

describe YamlCreator do

  let(:filepath) { 'C:\GitHub\test.yml' }
  let(:simple_array) { ["a", "b", "c"] }
  let(:complex_array) { ["a", ["b", "c"], "d"] }
  let(:complex_result_array) { ["a", "b", "c", "d"] }
  let(:simple_hash) { {a: "value_a", b: "value_b", c: "value_c"} }
  let(:simple_result_hash) { {"a" => "value_a", "b" => "value_b", "c" => "value_c"} }
  let(:complex_hash) { {a: {aa: "aa", bb: {bbb: "bbb"}, cc: "cc"}, b: "value_b"} }
  let(:complex_result_hash) { {"a" => {"aa" => "aa", "bb" => {"bbb" => "bbb"}, "cc" => "cc"}, "b" => "value_b"} }

  it 'has a version number' do
    expect(YamlCreator::VERSION).not_to be nil
  end

  it 'from array test, without enclosure' do

    YamlCreator.from_array(filepath, simple_array)
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_array
    File.delete(filepath)
  end

  it 'from array test, with enclosure' do

    YamlCreator.from_array(filepath, simple_array, '"')
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_array
    File.delete(filepath)
  end

  it 'from complex array test, without enclosure' do

    YamlCreator.from_complex_array(filepath, complex_array)
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq complex_result_array
    File.delete(filepath)
  end

  it 'from complex array test, with enclosure' do

    YamlCreator.from_complex_array(filepath, complex_array, '"')
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq complex_result_array
    File.delete(filepath)
  end

  it 'from hash test, without enclosure' do

    YamlCreator.from_hash(filepath, simple_hash)
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_result_hash
    File.delete(filepath)
  end

  it 'from hash test, with enclosure' do

    YamlCreator.from_hash(filepath, simple_hash, '"')
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq simple_result_hash
    File.delete(filepath)
  end

  it 'from complex hash test, without enclosure' do

    YamlCreator.from_complex_hash(filepath, complex_hash)
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq complex_result_hash
    File.delete(filepath)
  end

  it 'from complex hash test, with enclosure' do

    YamlCreator.from_complex_hash(filepath, complex_hash, '"')
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq complex_result_hash
    File.delete(filepath)
  end

  it 'from json test, without enclosure' do

    YamlCreator.from_json(filepath, complex_hash.to_json)
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq complex_result_hash
    File.delete(filepath)
  end

  it 'from json test, with enclosure' do

    YamlCreator.from_json(filepath, complex_hash.to_json, '"')
    expect(File.exist?(filepath)).to be_truthy

    yaml_array = YAML.load_file(filepath)
    expect(yaml_array).to eq complex_result_hash
    File.delete(filepath)
  end
end
