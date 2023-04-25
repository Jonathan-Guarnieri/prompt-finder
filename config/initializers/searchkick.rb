Searchkick.client = Elasticsearch::Client.new(
  hosts: ENV['ELASTICSEARCH_HOST'],
  user: ENV['ELASTIC_USERNAME'],
  password: ENV['ELASTIC_PASSWORD'],
  log: Rails.env.development?
)
