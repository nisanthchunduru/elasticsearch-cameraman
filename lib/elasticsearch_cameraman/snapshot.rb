module ElasticsearchCameraman
  class Snapshot
    class << self
      def all
        response = HTTParty.get("http://localhost:9200/_snapshot/#{repo_name}/_all")
        response["snapshots"].map { |snapshot_hash| ElasticsearchCameraman::Snapshot.new(snapshot_hash) }
      end

      def created_before(time)
        all.select { |snapshot| snapshot.created_before?(time) }
      end

      def delete(name)
        HTTParty.delete("http://localhost:9200/_snapshot/#{repo_name}/#{name}?wait_for_completion=true")
      end

      def delete_all
        all_snapshots.each { |snapshot| snapshot.delete }
      end
    end

    def initialize(snapshot_hash)
      @snapshot_hash = snapshot_hash
    end

    def name
      @snapshot_hash["snapshot"]
    end

    def created_before?(time)
      end_time < time
    end

    def end_time
      Time.parse(@snapshot_hash["end_time"])
    end

    def delete
      self.class.delete(name)
    end
  end
end
