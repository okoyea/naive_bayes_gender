class Classifier
  attr_reader :prob_male,:prob_female,:female_hm,:female_hv,
  :female_wm,:female_wv,:male_hm,:male_hv,:male_wm,:male_wv

  def initialize(sample)
    @males = sample.males
    @females = sample.females
    @total_males = @males.count.to_f
    @total_females = @females.count.to_f
  end

  def build
    @female_hm,@female_hv = @females.mean_and_dev(:height, @total_females)
    @female_wm,@female_wv = @females.mean_and_dev(:weight, @total_females)
    @male_hm,@male_hv = @males.mean_and_dev(:height, @total_males)
    @male_wm,@male_wv = @males.mean_and_dev(:weight, @total_males)

    training_set_size = @total_males + @total_females
    @prob_male = @total_males/training_set_size
    @prob_female = @total_females/training_set_size

    self
  end

  def make_prediction(male_post, female_post)
    if male_post == female_post
      return 'The gender cannot be determined - the posteriors of both genders are equal'
    elsif @total_males.zero? && !@total_females.zero?
      return 'The sample is female because of error - Add males to the training set to get a better prediction'
    elsif @total_females.zero? && !@total_males.zero?
      return 'The sample is male because of error - Add females to the training set to get a better prediction'
    elsif male_post > female_post
      return 'The sample is male'
    else
      return 'The sample is female'
    end
  end
end

