class Classifier
  def initialize(males,females)
    @males = males
    @females = females
    @total_males = males.count.to_f
    @total_females = females.count.to_f
  end

  def build_classifier
    female_hm,female_hv = @females.mean_and_stdev(:height, @total_females)
    female_wm,female_wv = @females.mean_and_stdev(:weight, @total_females)
    male_hm,male_hv = @males.mean_and_stdev(:height, @total_males)
    male_wm,male_wv = @males.mean_and_stdev(:weight, @total_males)

    training_set_size = @total_males + @total_females
    prob_male = @total_males/training_set_size
    prob_female = @total_females/training_set_size

    return  @males,@females,prob_male,prob_female,male_hm,male_hv,
            male_wm,male_wv,female_hm,female_hv,female_wm,female_wv
  end

  def make_prediction(male_post, female_post)
    if male_post.zero? && female_post.zero?
      return "The gender cannot be determined - the posteriors of both genders are equal"
    elsif @total_males.zero? && !@total_females.zero?
      return "Female - Add males to the training set to get a better prediction"
    elsif @total_females.zero? && !@total_males.zero?
      return "Male - Add females to the training set to get a better prediction"
    elsif male_post == female_post
      return "Unable to determine, the posteriors were the same."
    elsif male_post > female_post
      return "The sample is male"
    else
      return "The sample is female"
    end
  end
end

