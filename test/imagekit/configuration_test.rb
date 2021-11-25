require_relative './spec_helper'
require 'rspec/autorun'

RSpec.describe ImageKitIo::Configurable do
  let(:configurable_obj) { Class.new.send :include, ImageKitIo::Configurable}

  describe 'Configuration' do
    it 'configure with the keys' do
      configurable_obj.configure do |config|
        config.public_key = 'public_key_123'
      end
      expect(configurable_obj.config.public_key).to eq('public_key_123')
      # test the default service
      expect(configurable_obj.config.service).to eq(:carrierwave)
    end

    it 'configure without keys' do
      expect(configurable_obj.config.service).to eq(:carrierwave)
      expect(configurable_obj.config.private_key).to eq(nil)
    end

    context 'constants' do
      let(:constants) { configurable_obj.constants}

      it 'returns constant class' do
        expect(constants).to eq(ImageKitIo::Constant)
      end

      it "returns default key's value" do
        expect(constants.BASE_URL).to eq("https://api.imagekit.io/v1/files")
      end

      it "supports customization" do
        constants.TIMESTAMP = '88888'
        expect(constants.TIMESTAMP).to eq('88888')
        configurable_obj.configure do |config|
          config.constants.TIMESTAMP = '5555'
        end
        expect(configurable_obj.constants.TIMESTAMP).to eq('5555')
      end
    end

    context 'services' do
      it 'configures carrierwave by default' do
        expect(configurable_obj.config.service).to eq(:carrierwave)
        expect(configurable_obj).to receive(:require_relative).with('../carrierwave/carrierwave')
        expect(configurable_obj).to_not receive(:require_relative).with('../active_storage/active_storage')
        configurable_obj.configure do |config|
          config.private_key = 'private_key_123'
        end
      end

      it 'supports active_storage configuration' do
        expect(configurable_obj).to_not receive(:require_relative).with('../carrierwave/carrierwave')
        expect(configurable_obj).to receive(:require_relative).with('../active_storage/active_storage')
        configurable_obj.configure do |config|
          config.private_key = 'private_key_123'
          config.service = :active_storage
        end
        expect(configurable_obj.config.service).to eq(:active_storage)
      end
    end
  end
end
