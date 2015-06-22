namespace :csvimport do

  desc "Import CSV Data."
  task :fill => :environment do

    require 'csv'


    CSV.foreach("/Users/danielpetkevich/Dev/mturk/config/captcha.csv", :headers => true) do |row|
  		@question= Question.new(row.to_hash)
  		@question.save
	end

  end

end