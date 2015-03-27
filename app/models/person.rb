class Person < ActiveRecord::Base
  include Stats

  validates :gender, inclusion: { in: %w(male female) }, presence: true
  validates :height, inclusion: { in: 1..10 }, presence: true, numericality: true
  validates :weight, inclusion: { in: 1..1500 }, presence: true, numericality: true

  scope :male,   -> { where(gender: :male) }
  scope :female, -> { where(gender: :female) }

  def self.sufficient_records
    (male.count >= 1 && female.count >= 1) ? true : false
  end
end