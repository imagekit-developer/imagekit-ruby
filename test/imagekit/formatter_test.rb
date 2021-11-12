require_relative './helper'
require "rspec/autorun"

RSpec.describe "FormatterTest" do
    it "snake_to_camel_test" do
        result=ImageKitIo::Utils::Formatter.snake_to_camel('my_snake_to_camel')
        expect('mySnakeToCamel').to eq(result)
    end

    it "camel_to_snake_test" do
        result=ImageKitIo::Utils::Formatter.camel_to_snake('mySnakeToCamel')
        expect('my_snake_to_camel').to eq(result)
    end

    it "request_formatter_test" do
        result =ImageKitIo::Utils::Formatter.request_formatter({'my_snake' => 'test'})
        expect('mySnake').to eq(result.keys.first)
    end
    
end
