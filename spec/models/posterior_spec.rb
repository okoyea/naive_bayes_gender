require 'rails_helper'
require 'spec_helper'

RSpec.describe Posterior, type: :model do
  describe 'get_posteriors' do
    let(:males) { Person.where(gender: :male) }
    let(:females) { Person.where(gender: :female) }
    let(:sample) { Sample.new(males,females,6,200) }
    let(:classifier) { Classifier.new(sample).build }

    before do
      Person.create(gender: :male, height: 6.0, weight: 200)
      Person.create(gender: :male, height: 6.5, weight: 250)
      Person.create(gender: :male, height: 5.5, weight: 150)
      Person.create(gender: :male, height: 5.0, weight: 120)
      Person.create(gender: :female, height: 4.5, weight: 90)
      Person.create(gender: :female, height: 5.0, weight: 110)
      Person.create(gender: :female, height: 5.3, weight: 130)
      Person.create(gender: :female, height: 5.6, weight: 140)

      @male_post, @female_post = Posterior.calculate(sample, classifier)
    end

    it 'should return a posterior for males' do
      expect(@male_post).to be_within(0.5).of(1)
    end

    it 'should return a posterior for females' do
      expect(@female_post).to be_within(0.5).of(0)
    end
  end
end