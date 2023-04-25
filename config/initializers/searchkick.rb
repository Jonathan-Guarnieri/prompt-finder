require 'elasticsearch/model'

Rails.application.config.to_prepare do
  Elasticsearch::Model.client = Elasticsearch::Client.new(
    host: ENV['SEARCHBOX_URL']
  )

  Searchkick.client = Elasticsearch::Client.new(
    url: ENV['SEARCHBOX_URL'],
    user: ENV['ELASTIC_USERNAME'],
    password: ENV['ELASTIC_PASSWORD'],
    log: Rails.env.development?
  )
end
