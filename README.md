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
city_name = 'New York'

begin
  temperature = WeatherSdk::Client.get_weather_by_city(city_name, api_key)
  puts "The current temperature in #{city_name} is #{temperature} degrees Celsius."
rescue WeatherSdk::Error => e
  puts "Error: #{e.message}"
end
```

Make sure to replace `'your_api_key'` with your actual API key.

## API response
The `get_weather_by_city` method returns the current temperature in Celsius for the specified city. In case of an error, it raises a `WeatherSdk::Error` with a descriptive message.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or create a pull request.

## License

The Weather SDK Gem is released under the [MIT License](https://github.com/fabiosoaresv/weather_sdk/blob/main/LICENSE.txt).