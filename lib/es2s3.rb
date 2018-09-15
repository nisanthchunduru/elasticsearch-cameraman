require "httparty"
require "json"

require "es2s3/timestamp"

def config
  @config ||= YAML.load_file(File.expand_path("~/.es2s3.yml"))
end

def repo_exists?
  response = HTTParty.get("http://localhost:9200/_snapshot/_all")
  parsed_response_body = JSON.parse(response.body)
  return true if parsed_response_body.has_key?(repo_name)
  false
end

def create_repo
  options = {
    body: {
      type: "s3",
      settings: {
        region: config["region"],
        bucket: config["bucket"],
        base_path: config["base_path"],
        access_key: config["access_key"],
        secret_key: config["secret_key"]
      }
    }.to_json
  }
  HTTParty.put("http://localhost:9200/_snapshot/#{repo_name}", options)
end

def create_snapshot
  snapshot_name = "snapshot-#{ES2S3::Timestamp.generate}"
  HTTParty.put("http://localhost:9200/_snapshot/#{repo_name}/#{snapshot_name}?wait_for_completion=true")
end

def repo_name
  "s3_repo"
end
