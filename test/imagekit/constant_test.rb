require_relative './spec_helper'
require 'rspec/autorun'

RSpec.describe ImageKitIo::Constantable do
  let(:constantable_class) { ImageKitIo::Constant }

  it 'defines the constants method in included class' do
    constantable_obj = Class.new.send(:include, ImageKitIo::Constantable)
    expect(constantable_obj).to receive(:constants).and_return(true)
    constantable_obj.constants
  end

  it "returns the defined constant's value" do
    expect(constantable_class).to receive(:method_missing).and_call_original
    expect(constantable_class.BASE_URL).to eq("https://api.imagekit.io/v1/files")
  end
end
