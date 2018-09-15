module ElasticsearchCameraman
  class Timestamp
    class << self
      def generate
        Time.now.strftime("%Y%m%d%H%M%S")
      end
    end
  end
end
