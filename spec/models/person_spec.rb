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
end