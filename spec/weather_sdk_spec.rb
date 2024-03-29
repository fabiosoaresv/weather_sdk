# frozen_string_literal: true

require "weather_sdk"
require 'webmock/rspec'

RSpec.describe WeatherSdk::Client do
  let(:api_url) { 'https://api.openweathermap.org/data/2.5/forecast/' }
  let(:language) { 'pt_br' }
  let(:range_days) { 40 }
  let(:unit) { 'metric' }
  let(:config) { WeatherSdk::Config.new(api_url, language, unit, range_days) }

  describe 'validate version and' do
    it 'return a version number' do
      expect(WeatherSdk::VERSION).not_to be nil
    end
  end

  describe '.get_weather_by_city_id' do
    let(:service) { WeatherSdk::GetByCityService }

    context 'with a valid city and API key' do
      let(:id) { '3453610' }
      let(:api_key) { 'valid_api_key' }

      it 'returns the temperature' do
        fixture_path = File.join(File.dirname(__FILE__), 'fixtures', 'weather_response.json')
        fixture = File.read(fixture_path)

        stub_request(:get, /#{config.api_url}/).to_return(status: 200, body: fixture)

        response = WeatherSdk::Client.new(service).get_weather_by_city_id(id, api_key)
        first_temperature = response.dig(:temperatures).first

        expect(first_temperature.dig(:date)).to eq("27/01")
        expect(first_temperature.dig(:temperature)).to eq(17.35)
        expect(first_temperature.dig(:weather)).to eq('nuvens dispersas')
        expect(response.dig(:city_name)).to eq('Piraju')
      end
    end

    context 'with an invalid city or unable to execute request' do
      let(:id) { 'NonexistentCity' }
      let(:api_key) { 'invalid_api_key' }

      it 'raises an error with a specific message' do
        stub_request(:get, /#{config.api_url}/)
          .to_return(status: 404, body: '')

        expect { WeatherSdk::Client.new(service).get_weather_by_city_id(id, api_key) }
          .to raise_error(WeatherSdk::Error, 'Cannot find city or execute request')
      end
    end
  end
end
