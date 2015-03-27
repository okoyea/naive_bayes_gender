require 'rails_helper'
require 'spec_helper'

RSpec.describe Sample, type: :model do
  describe 'valid?' do
    let(:males) { Person.where(gender: :male) }
    let(:females) { Person.where(gender: :female) }
    let(:valid_sample) { Sample.new(males,females,6,200) }
    let(:invalid_sample) { Sample.new(males,females, 6, nil) }

    it 'should return true if height and weight are not zero' do
      expect(valid_sample.valid?).to eq true
    end

    it 'should return false if either height or weight are zero' do
      expect(invalid_sample.valid?).to eq false
    end
  end
end