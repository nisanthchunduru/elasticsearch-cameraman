require "httparty"
require "json"

require "elasticsearch_cameraman/timestamp"
require "elasticsearch_cameraman/snapshot"

def config
  @config ||= YAML.load_file(File.expand_path("~/.elasticsearch_cameraman.yml"))
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

def delete_repo
  HTTParty.delete("http://localhost:9200/_snapshot/#{repo_name}")
end

def create_snapshot
  snapshot_name = "snapshot-#{ElasticsearchCameraman::Timestamp.generate}"
  HTTParty.put("http://localhost:9200/_snapshot/#{repo_name}/#{snapshot_name}?wait_for_completion=true")
end

def all_snapshots
  ElasticsearchCameraman::Snapshot.all
end

def delete_snapshot_having_name(snapshot_name)
  ElasticsearchCameraman::Snapshot.delete(snapshot_name)
end

def delete_snapshots_created_before(time)
  ElasticsearchCameraman::Snapshot.created_before(time).each { |snapshot| snapshot.delete }
end

def repo_name
  "s3_backup_repo"
end
