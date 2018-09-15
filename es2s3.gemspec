Gem::Specification.new do |s|
  s.name          = "es2s3"
  s.summary       = "Backup Elasticsearch to Amazon S3"
  s.version       = `cat VERSION`
  s.date          = "2018-09-15"
  s.authors       = ["Nisanth Chunduru"]
  s.email         = ["nisanth074@gmail.com"]
  s.files         = Dir["{lib}/**/*"] + ["README.md"]

  s.add_dependency("httparty")

  s.add_development_dependency("rake")
  s.add_development_dependency("pry")
end