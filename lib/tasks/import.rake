require 'csv'

namespace :import_csv do
  desc "Import prompts from CSV file"
  task :prompts => :environment do
    filepath = Rails.root.join('data', 'eval.csv')

    CSV.foreach(filepath, headers: true) do |row|
      Prompt.create(content: row[1])
    end

    puts "Import completed"
  end
end
