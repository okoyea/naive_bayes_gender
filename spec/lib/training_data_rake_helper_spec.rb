require 'rails_helper'
require 'spec_helper'

describe 'Training data helper for training_data:import rake task' do
  context 'when the data is valid' do
    let(:helper) { TrainingDataHelper.new(@full_path) }
    let(:test_json) { JSON.parse(@test_file) }

    before do
      @full_path = "#{Rails.root}/spec/support/valid.json"
      root_path = File.expand_path("~/") + "/"
      @full_path.slice!(root_path)

      test_path = File.expand_path("~/") + "/" + @full_path
      @test_file = File.open("#{test_path}").read
    end

    it 'should properly import the file' do
      helper.get_json
      expect(helper.json).to eq(test_json)
    end

    it 'should import all people' do
      silence_stream(STDOUT) do
        expect{ helper.parse_file }.to change(Person, :count).by(2)
      end
    end

    it 'should not raise an error' do
      silence_stream(STDOUT) do
        expect{helper.parse_file}.to_not raise_error
      end
    end
  end

  context 'when the data is invalid' do
    let(:helper) { TrainingDataHelper.new(@full_path) }
    let(:test_json) { JSON.parse(@test_file) }

    before do
      @full_path = "#{Rails.root}/spec/support/invalid.json"
      root_path = File.expand_path("~/") + "/"
      @full_path.slice!(root_path)

      test_path = File.expand_path("~/") + "/" + @full_path
      @test_file = File.open("#{test_path}").read
    end

    it 'should properly import the file' do
      helper.get_json
      expect(helper.json).to eq(test_json)
    end

    it 'should raise an error' do
      expect{ helper.parse_file }.to raise_error(ArgumentError)
    end
  end
end