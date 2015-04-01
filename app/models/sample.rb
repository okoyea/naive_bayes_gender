class Sample
  attr_reader :males,:females,:height,:weight

  def initialize(males,females,height,weight)
    @males = males
    @females = females
    @height = height.to_f
    @weight = weight.to_f
  end

  def valid?
    !@height.zero? && !@weight.zero?
  end
end