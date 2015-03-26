class GenderClassifiersController < ApplicationController
  def create
    males = Person.where(gender: :male)
    females = Person.where(gender: :female)

    gender_classifier = Classifier.new(males,females)
    posterior = Posterior.new(params[:height],params[:weight])

    male_post, female_post = posterior.get_posteriors(gender_classifier.build_classifier)
    @prediction = gender_classifier.make_prediction(male_post, female_post)
  end
end