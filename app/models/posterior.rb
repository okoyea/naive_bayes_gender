class Posterior
  def self.calculate(sample, classifier)
    males = sample.males
    females = sample.females

    male_prob_height = males.normal_distribution(classifier.male_hm, classifier.male_hv, sample.height)
    male_prob_weight = males.normal_distribution(classifier.male_wm, classifier.male_wv, sample.weight)

    female_prob_height = females.normal_distribution(classifier.female_hm, classifier.female_hv, sample.height)
    female_prob_weight = females.normal_distribution(classifier.female_wm, classifier.female_wv, sample.weight)

    male_numerator = classifier.prob_male * male_prob_weight * male_prob_height
    female_numerator = classifier.prob_female * female_prob_height * female_prob_weight

    evidence = male_numerator + female_numerator

    if evidence == 0
      return 0, 0
    else
      return male_numerator/evidence, female_numerator/evidence
    end
  end
end