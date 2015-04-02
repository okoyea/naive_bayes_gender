namespace :training_data do
  desc "Import training data from file to database"

  task :import, [:filename] => :environment do |task, args|
    helper = TrainingDataHelper.new(args.filename)
    helper.parse_file
  end
end