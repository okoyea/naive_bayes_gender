require 'active_support/concern'

module Stats
  extend ActiveSupport::Concern

  included do
    def self.mean_and_dev(attribute, size)
      return first.attribute.to_f, 0.0 if size == 1

      mean = average(attribute)
      variance = pluck(attribute).inject(0) { |var, x| var += (x - mean) ** 2 }

      return mean, Math.sqrt(variance/(size-1))
    end

    def self.normal_distribution(mean, var, attribute)
      return 0 if var == 0

      return (1/Math.sqrt(2*Math::PI*var))*(Math::E**((-(attribute-mean)**2)/(2*var)))
    end
  end
end