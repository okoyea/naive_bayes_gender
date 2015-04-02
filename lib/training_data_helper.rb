class TrainingDataHelper
  attr_accessor :json

  TIME = Time.now.utc

  def initialize(filename)
    @filename = filename
  end

  def parse_file
    get_json
    import
  end

  def get_json
    path = File.expand_path("~/") + "/" + @filename
    file = File.open("#{path}").read
    self.json = JSON.parse(file)
  end

  def import
    self.json["people"].each do |person|
      gender = (person['person']['gender'])
      height = (person['person']['height'])
      weight = (person['person']['weight'])

      if gender.nil? || height.nil? || weight.nil?
        raise ArgumentError, "Person with id #{person['person']['id']} has a missing or null attribute"
      else
        sql = "INSERT INTO people (gender, height, weight, created_at, updated_at) VALUES
              ('#{gender.downcase.to_s}', #{height.round}, #{weight.round}, '#{TIME}', '#{TIME}')"
        ActiveRecord::Base.connection.execute(sql)
      end
    end
  end
end