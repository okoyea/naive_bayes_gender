class Person < ActiveRecord::Base
  validates :gender, inclusion: { in: %w(male female) }, presence: true
  validates :height, inclusion: { in: 1..10 }, presence: true, numericality: true
  validates :weight, inclusion: { in: 1..1500 }, presence: true, numericality: true

  def self.mean_and_stdev(attribute, size)
    return first.attribute.to_f, 0.0 if size == 1

    mean = average(attribute)
    variance = pluck(attribute).inject(0) { |var, x| var += (x - mean) ** 2 }

    return mean, Math.sqrt(variance/(size-1))
  end

  def self.normal_dist(mean, var, attribute)
    return 0 if var == 0

    return (1/Math.sqrt(2*Math::PI*var))*(Math::E**((-(attribute-mean)**2)/(2*var)))
  end
end