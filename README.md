# WeatherSdk

The Weather SDK Gem is a Ruby library that provides a simple interface to fetch weather information for a given city using the OpenWeatherMap API. It allows developers to easily integrate weather data into their Ruby applications.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add weather_sdk

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install weather_sdk

## Usage

To get started with the Weather SDK Gem, you need an API key from OpenWeatherMap. Once you have the API key, you can use the gem as follows:

```ruby
require 'weather_sdk'

# Replace 'your_api_key' with your actual OpenWeatherMap API key
api_key = 'your_api_key'
city_id = '123'
service = WeatherSdk::GetByCityService
sdk = WeatherSdk::Client.new(service)

begin
  response = sdk.get_weather_by_city_id(city_id, api_key)
  puts "The current temperatures in #{response[:cit_name]} is #{response[:temperatures]}."
rescue WeatherSdk::Error => e
  puts "Error: #{e.message}"
end
```

Make sure to replace `'your_api_key'` with your actual API key.

## API response
The `get_weather_by_city_id` method returns the current temperatures in Celsius for the specified city. In case of an error, it raises a `WeatherSdk::Error` with a descriptive message.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or create a pull request.

## Running unit tests
The project are using RSpec, you can run this command to execute the unit tests:
```console
$ rspec spec/weather_sdk_spec.rb
...

Finished in 0.14229 seconds (files took 3.84 seconds to load)
3 examples, 0 failures
```

## License

The Weather SDK Gem is released under the [MIT License](https://github.com/fabiosoaresv/weather_sdk/blob/main/LICENSE.txt).
