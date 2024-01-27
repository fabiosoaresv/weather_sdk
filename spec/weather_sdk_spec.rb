# frozen_string_literal: true

require "weather_sdk"
require 'webmock/rspec'

RSpec.describe WeatherSdk::Client do
  describe 'validate version and' do
    it 'return a version number' do
      expect(WeatherSdk::VERSION).not_to be nil
    end
  end

  describe '.get_weather_by_city' do
    let(:service) { WeatherSdk::GetByCityService }

    context 'with a valid city and API key' do
      let(:city_name) { 'Piraju' }
      let(:api_key) { 'valid_api_key' }

      it 'returns the temperature' do
        fixture_path = File.join(File.dirname(__FILE__), 'fixtures', 'weather_response.json')
        fixture = File.read(fixture_path)

        stub_request(:get, /#{WeatherSdk::Config::API_URL}/).to_return(status: 200, body: fixture)

        response = WeatherSdk::Client.new(service).get_weather_by_city(city_name, api_key)
        first_data = response.first

        expect(first_data.dig(:date)).to eq("27/01")
        expect(first_data.dig(:temperature)).to eq(17.35)
        expect(first_data.dig(:weather)).to eq('nuvens dispersas')
      end
    end

    context 'with an invalid city or unable to execute request' do
      let(:city_name) { 'NonexistentCity' }
      let(:api_key) { 'invalid_api_key' }

      it 'raises an error with a specific message' do
        stub_request(:get, /#{WeatherSdk::Config::API_URL}/)
          .to_return(status: 404, body: '')

        expect { WeatherSdk::Client.new(service).get_weather_by_city(city_name, api_key) }
          .to raise_error(WeatherSdk::Error, 'Cannot find city or execute request')
      end
    end
  end
end
