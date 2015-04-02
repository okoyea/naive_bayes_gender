require 'rails_helper'
require 'spec_helper'

describe 'training_data helper for rake task' do
  describe 'when the data is valid' do
    before do
      @full = Dir.pwd + "/spec/support/valid.json"
      root = File.expand_path("~/") + "/"
      @full.slice!(root)
    end

    it 'should import all people' do
      helper = TrainingDataHelper.new(@full)
      expect{helper.parse_file}.to change(Person, :count).by(2)
    end

    it 'should not raise an error' do
        helper = TrainingDataHelper.new(@full)
      expect{helper.parse_file}.to_not raise_error
    end
  end

  describe 'when the data is invalid' do
    before do
      @full = Dir.pwd + "/spec/support/invalid.json"
      root = File.expand_path("~/") + "/"
      @full.slice!(root)
    end

    it 'should raise an error' do
      helper = TrainingDataHelper.new(@full)
      expect{helper.parse_file}.to raise_error(ArgumentError)
    end
  end
end