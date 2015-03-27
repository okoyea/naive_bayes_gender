class Person < ActiveRecord::Base
  include Stats

  validates :gender, inclusion: { in: %w(male female) }, presence: true
  validates :height, inclusion: { in: 1..10 }, presence: true, numericality: true
  validates :weight, inclusion: { in: 1..1500 }, presence: true, numericality: true
end