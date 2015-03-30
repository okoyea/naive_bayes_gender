require 'rails_helper'
require 'spec_helper'

RSpec.describe Classifier, type: :model do

  describe 'build_classifier' do
    let(:males) { Person.male }
    let(:females) { Person.female }
    let(:sample) { Sample.new(males,females,6,200) }
    let(:classifier) { Classifier.new(sample) }

    before do
      Person.create(gender: :male, height: 6.0, weight: 200)
      Person.create(gender: :male, height: 6.5, weight: 250)
      Person.create(gender: :male, height: 5.5, weight: 150)
      Person.create(gender: :male, height: 5.0, weight: 120)
      Person.create(gender: :female, height: 4.5, weight: 90)
      Person.create(gender: :female, height: 5.0, weight: 110)
      Person.create(gender: :female, height: 5.3, weight: 130)
      Person.create(gender: :female, height: 5.6, weight: 140)
    end

    it 'should return a male probability' do
      expect(classifier.prob_male).to eq 0.5
    end

    it 'should return a female probability' do
      expect(classifier.prob_female).to eq 0.5
    end

    it 'should return a male height mean' do
      expect(classifier.male_hm).to be_within(0.5).of(5.5)
    end

    it 'should return a male height variance' do
      expect(classifier.male_hv).to eq 0.5773502691896257
    end

    it 'should return a male weight mean' do
      expect(classifier.male_wm).to be_within(5).of(180)
    end

    it 'should return a male weight variance' do
      expect(classifier.male_wv).to eq 57.154760664940824
    end

    it 'should return a female height mean' do
      expect(classifier.female_hm).to be_within(0.5).of(4.7)
    end

    it 'should return a female height variance' do
      expect(classifier.female_hv).to eq 0.5
    end

    it 'should return a female weight mean' do
      expect(classifier.female_wm).to be_within(5).of(120)
    end

    it 'should return a female weight variance' do
      expect(classifier.female_wv).to eq  22.173557826083453
    end
  end

  describe 'make_prediction' do
    let(:males) { Person.male }
    let(:females) { Person.female }
    let(:sample) { Sample.new(males,females,6,200) }
    let(:classifier) { Classifier.new(sample) }

    before(:each) do
      create :person, :male
      create :person, :female
    end

    it 'should be undetermined when both posteriors are equal' do
      expect(classifier.make_prediction(0,0)).to include 'cannot be determined'
    end

    it 'should be female when the male posterior is zero and female is not' do
      expect(classifier.make_prediction(0,1)).to include 'female'
    end

    it 'should be male when the female posterior is zero and male is not' do
      expect(classifier.make_prediction(1,0)).to include 'male'
    end

    it 'should be male when the male posterior is larger' do
      expect(classifier.make_prediction(2,1)).to include 'male'
    end

    it 'should be female when the female posterior is larger' do
      expect(classifier.make_prediction(1,2)).to include 'female'
    end
  end
end