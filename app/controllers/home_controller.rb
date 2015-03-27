class HomeController < ApplicationController
  before_action :find_genders, only: [:create]
  before_action :find_sample, only: [:index]

  def create
    sample = Sample.new(@males,@females, params[:post][:height], params[:post][:weight])

    if sample.valid?
      classifier = Classifier.new(sample).build
      mp, fp = Posterior.calculate(sample,classifier)
      @message = classifier.make_prediction(mp,fp)
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