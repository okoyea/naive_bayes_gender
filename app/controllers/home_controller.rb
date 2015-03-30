class HomeController < ApplicationController
  before_action :find_genders, only: [:get_prediction]
  before_action :find_sample,  only: [:index]

  def get_prediction
    sample = Sample.new(@males,@females,params[:post][:height],params[:post][:weight])

    if sample.valid?
      classifier = Classifier.new(sample)
      posterior = Posterior.calculate(sample,classifier)
      @message = classifier.make_prediction(posterior[0],posterior[1])
    else
      @message = 'Invalid data has been entered'
    end
  end


  private

  def find_genders
    @males = Person.male
    @females = Person.female
  end

  def find_sample
    @sample = Sample.new(@males,@females,params[:height],params[:weight])
  end
end