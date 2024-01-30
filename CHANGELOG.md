## Changelog

## [2.0.4] - 2024-01-30

  * Added gitignore


## [2.0.3] - 2024-01-30

  * Changed config to receive the values by variables.


## [2.0.2] - 2024-01-28

  * Changed service GetByCityService to get temperature by id.


## [2.0.1] - 2024-01-27

  * Applied SOLID principles to improve code structure and maintainability.


## [2.0.0] - 2024-01-26

  * Modified the `get_weather_by_city` method in the Weather SDK to include temperature data for today and the next 5 days.
  * Removed the `convert_kelvin_to_celsius` method and passed the temperature unit as a parameter in the request to retrieve temperatures in degrees Celsius.
  * Added support for the Portuguese (Brazil) language (`pt_br`) to provide weather descriptions in Portuguese.
  * Introduced a fixture for the OpenWeatherMap JSON response to enhance testing.


## [1.0.2] - 2024-01-26

  * Fix method `convert_kelvin_to_celsius` and unit tests.


## [1.0.1] - 2024-01-26

  * Fix the returns temperature data in Celsius.


## [1.0.0] - 2024-01-26

  * Retrieve current weather information by city name.
  * Returns temperature data in Celsius.