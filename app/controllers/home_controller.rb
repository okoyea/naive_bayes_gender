class HomeController < ApplicationController
  before_action :find_genders, only: [:create]

  def create
    sample = Sample.new(@males,@females,params[:height],params[:weight])

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
    @males = Person.where(gender: :male)
    @females = Person.where(gender: :female)
  end
end