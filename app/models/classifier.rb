class Classifier
  attr_accessor :prob_male,:prob_female,:female_hm,:female_hv,
  :female_wm,:female_wv,:male_hm,:male_hv,:male_wm,:male_wv

  def initialize(sample)
    @males = sample.males
    @females = sample.females
    @total_males = @males.size.to_f
    @total_females = @females.size.to_f

    build
  end

  def build
    self.female_hm,self.female_hv = @females.mean_and_dev(:height, @total_females)
    self.female_wm,self.female_wv = @females.mean_and_dev(:weight, @total_females)

    self.male_hm,self.male_hv = @males.mean_and_dev(:height, @total_males)
    self.male_wm,self.male_wv = @males.mean_and_dev(:weight, @total_males)

    training_set_size = @total_males + @total_females
    self.prob_male = @total_males/training_set_size
    self.prob_female = @total_females/training_set_size
  end

  def make_prediction(male_post, female_post)
    if male_post == female_post
      return 'The gender cannot be determined - the posteriors of both genders are equal'
    elsif @total_males.zero? && !@total_females.zero?
      return 'The sample is female, but because of error - Add males to the training set to get a better prediction'
    elsif @total_females.zero? && !@total_males.zero?
      return 'The sample is male, but because of error - Add females to the training set to get a better prediction'
    elsif male_post > female_post
      return 'The sample is male'
    else
      return 'The sample is female'
    end
  end
end

