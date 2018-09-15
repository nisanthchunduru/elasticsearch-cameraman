module ElasticsearchCameraman
  class Snapshot
    def initialize(snapshot_hash)
      @snapshot_hash = snapshot_hash
    end

    def name
      @snapshot_hash["snapshot"]
    end
  end
end
