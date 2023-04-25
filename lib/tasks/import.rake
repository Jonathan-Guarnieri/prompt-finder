require 'csv'

namespace :import_csv do
  desc "Import prompts from CSV file"
  task :prompts, [:filename] => :environment do |_task, args|
    if args.filename.nil? || args.filename.empty?
      puts "Please provide a filename as an argument."
      puts "Example: bundle exec rake import_csv:prompts[my_file.csv]"
      exit
    end

    filepath = Rails.root.join('data', args.filename)

    unless File.exist?(filepath)
      puts "File not found in the data folder."
      exit
    end

    batch_size = 1000
    prompts = []

    CSV.foreach(filepath, headers: true) do |row|
      prompts << Prompt.new(content: row[1])

      if prompts.size >= batch_size
        Prompt.import prompts
        prompts.clear
      end
    end

    # Import any remaining prompts
    Prompt.import prompts unless prompts.empty?

    puts "Import completed"
  end
end
