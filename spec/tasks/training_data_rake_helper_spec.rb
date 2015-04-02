require 'rails_helper'
require 'spec_helper'

describe 'training_data helper for rake task' do

  context 'when the data is valid' do
    let(:helper) { TrainingDataHelper.new(@full) }
    let(:test_json) { JSON.parse(@file) }

    before do
      @full = Dir.pwd + "/spec/support/valid.json"
      root = File.expand_path("~/") + "/"
      @full.slice!(root)
      path = File.expand_path("~/") + "/" + @full
      @file = File.open("#{path}").read
    end

    it 'should properly import the file ' do
      helper.get_json
      expect(helper.json).to eq(test_json)
    end

    it 'should import all people' do
      expect{helper.parse_file}.to change(Person, :count).by(2)
    end

    it 'should not raise an error' do
      expect{helper.parse_file}.to_not raise_error
    end
  end

  context 'when the data is invalid' do
    let(:helper) { TrainingDataHelper.new(@full) }
    let(:test_json) { JSON.parse(@file) }

    before do
      @full = Dir.pwd + "/spec/support/invalid.json"
      root = File.expand_path("~/") + "/"
      @full.slice!(root)
      path = File.expand_path("~/") + "/" + @full
      @file = File.open("#{path}").read
    end

    it 'should properly import the file ' do
      helper.get_json
      expect(helper.json).to eq(test_json)
    end

    it 'should raise an error' do
      expect{helper.parse_file}.to raise_error(ArgumentError)
    end
  end
end