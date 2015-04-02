namespace :training_data do
  desc "Import training data from file to database"

  task :import, [:filename] => :environment do |task, args|
    TrainingDataHelper.new(args.filename).parse_file
  end
end