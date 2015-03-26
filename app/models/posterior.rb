class Posterior
  def initialize(height, weight)
    @height = height.to_f
    @weight = weight.to_f
  end

  def get_posteriors(classifier)
    males,females,prob_male,prob_female,male_hm,male_hv,male_wm,
    male_wv,female_hm,female_hv,female_wm,female_wv = classifier

    male_prob_height = males.normal_dist(male_hm, male_hv, @height)
    male_prob_weight = males.normal_dist(male_wm, male_wv, @weight)
    female_prob_height = females.normal_dist(female_hm, female_hv, @height)
    female_prob_weight = females.normal_dist(female_wm, female_wv, @weight)
    male_numerator = prob_male * male_prob_weight * male_prob_height
    female_numerator = prob_female * female_prob_height * female_prob_weight

    evidence = male_numerator + female_numerator
    return 0, 0 if evidence == 0

    return male_numerator/evidence, female_numerator/evidence
  end
end