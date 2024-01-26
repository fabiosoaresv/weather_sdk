# frozen_string_literal: true
#require_relative 'path/to/weather_sdk'

RSpec.describe WeatherSdk::Client do
  describe 'validate version and' do
    it 'return a version number' do
      expect(WeatherSdk::VERSION).not_to be nil
    end
  end

  describe '.get_weather_by_city' do
    context 'with a valid city and API key' do
      let(:city_name) { 'Piraju' }
      let(:api_key) { 'valid_api_key' }

      it 'returns the temperature' do
        stub_request(:get, /#{WeatherSdk::Client::API_URL}/)
          .to_return(status: 200, body: '{"main": {"temp": 25.5}}')

        temperature = WeatherSdk::Client.get_weather_by_city(city_name, api_key)
        expect(temperature).to eq(25.5)
      end
    end

    context 'with an invalid city or unable to execute request' do
      let(:city_name) { 'NonexistentCity' }
      let(:api_key) { 'invalid_api_key' }

      it 'raises an error with a specific message' do
        stub_request(:get, /#{WeatherSdk::Client::API_URL}/)
          .to_return(status: 404, body: '')

        expect { WeatherSdk::Client.get_weather_by_city(city_name, api_key) }
          .to raise_error(WeatherSdk::Error, 'Cannot find city or execute request')
      end
    end
  end
end
