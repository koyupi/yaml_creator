# YamlCreator

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/yaml_creator`. To experiment with that code, run `bin/console` for an interactive prompt.

Create yaml file from array, hash, and json.
This gem not use yaml lib.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yaml_creator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yaml_creator

## Usage

```ruby
# YAML file from array
# with enclosure.
YamlCreator.from_array('your filepath', array, '"')
# without enclosure.
YamlCreator.from_array('your filepath', array)

# YAML file from complex array(you can use nest)
# array is made flatter and is made as yaml.
# with enclosure, complex array.
YamlCreator.from_complex_array('your filepath', array, '"')
# without enclosure, complex array.
YamlCreator.from_complex_array('your filepath', array)

# YAML file from hash
# with enclosure.
YamlCreator.from_hash('your filepath', hash, '"')
# without enclosure.
YamlCreator.from_hash('your filepath', hash)

# YAML file from complex hash(you can use nest)
# tab is four space string.
# with enclosure, complex hash.
YamlCreator.from_complex_hash('your filepath', hash, '"')
# without enclosure, complex hash.
YamlCreator.from_complex_hash('your filepath', hash)

# YAML file from JSON
# with enclosure.
YamlCreator.from_json('your filepath', json, '"')
# without enclosure.
YamlCreator.from_json('your filepath', json)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koyupi/yaml_creator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

