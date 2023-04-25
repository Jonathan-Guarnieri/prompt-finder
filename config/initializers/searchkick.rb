module Elasticsearch
  class Client
    def verify_with_version_or_header(body, version, headers)
      @verified = true
    end
  end
end

if Rails.env == 'production'
  url = ENV["BONSAI_URL"]
  transport_options = { request: { timeout: 250 } }
  options = { hosts: url, retry_on_failure: true, transport_options: transport_options }
  Searchkick.client = Elasticsearch::Client.new(options)
else
  Searchkick.client = Elasticsearch::Client.new(
    hosts: ENV['ELASTICSEARCH_HOST'],
    user: ENV['ELASTIC_USERNAME'],
    password: ENV['ELASTIC_PASSWORD'],
    log: Rails.env.development?
  )
end
