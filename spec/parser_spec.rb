require 'spec_helper'
require 'yaml'

describe YamlCreator::Parser do

  let(:simple_array) { ["a", "b", "c"] }
  let(:simple_result_array) { ["- a", "- b", "- c"] }
  let(:simple_result_enclosure_array) { ['- "a"', '- "b"', '- "c"'] }
  let(:simple_hash) { {a: "value_a", b: "value_b", c: "value_c"} }
  let(:simple_result_hash) { ["a: value_a", "b: value_b", "c: value_c"] }
  let(:simple_result_enclosure_hash) { ['a: "value_a"', 'b: "value_b"', 'c: "value_c"'] }

  it 'create simple array test, without enclosure' do

    yaml_array = YamlCreator::Parser.from_array(simple_array)
    expect(yaml_array).to eq simple_result_array
  end

  it 'create simple array test, with enclosure' do

    yaml_array = YamlCreator::Parser.from_array(simple_array, '"')
    expect(yaml_array).to eq simple_result_enclosure_array
  end

  it 'create simple hash test, without enclosure' do

    yaml_array = YamlCreator::Parser.from_hash(simple_hash)
    expect(yaml_array).to eq simple_result_hash
  end

  it 'create simple hash test, with enclosure' do

    yaml_array = YamlCreator::Parser.from_hash(simple_hash, '"')
    expect(yaml_array).to eq simple_result_enclosure_hash
  end
end
