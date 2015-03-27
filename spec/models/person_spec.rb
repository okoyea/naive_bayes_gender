require 'rails_helper'
require 'spec_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    it { should validate_presence_of :gender }
    it { should validate_inclusion_of(:gender).in_array(%w(male female)) }

    it { should validate_presence_of :height }
    it { should validate_numericality_of :height }
    it { should validate_inclusion_of(:height).in_range(1..10) }

    it { should validate_presence_of :weight }
    it { should validate_numericality_of :weight }
    it { should validate_inclusion_of(:weight).in_range(1..1500) }
  end

  context 'scopes' do
    before(:each) do
      @males = create_list :person, 4, :male
      @females = create_list :person, 4, :female
    end

    describe 'male' do
      it "should include only males" do
        expect(Person.male).to eq @males
      end

      it "should not include females" do
        expect(Person.male).to_not eq @females
      end
    end

    describe 'female' do
      it "should include only females" do
        expect(Person.female).to eq @females
      end

      it "should not include males" do
        expect(Person.female).to_not eq @males
      end
    end
  end

  describe 'sufficient_records' do
    it 'should return true when both genders have more than one record' do
      create :person, :male
      create :person, :female
      expect(Person.sufficient_records).to eq true
    end

    it 'should return false when either gender has less than one record' do
      create :person, :male
      expect(Person.sufficient_records).to be false
    end
  end
end