---

I don't maintain elasticsearch-cameraman anymore. I recommend using Elastic's [elasticsearch-curator](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html) command line tool to backup your Elasticsearch instance to Amazon S3.

I've written a comprehensive article on backing up Elasticsearch to Amazon S3 with curl and elasticsearch-curator https://nisanthchunduru.wordpress.com/2018/10/20/backup-elasticsearch-in-aws-s3/

---

# elasticsearch-cameraman

A command line tool to backup Elasticsearch to Amazon S3

## Installation

Clone the repo

```
git clone git@github.com:nisanth074/elasticsearch-cameraman.git
```

### Usage

Create a snapshot

```
bin/cameraman snapshot
```

List existing snapshots

```
bin/cameraman snapshot
```

Delete a specific snapshot

```
bin/cameraman snapshot_name
```

Delete snapshots older than the given number of days

```
bin/cameraman --older-than 30
```

## Todo

- Publish the gem on rubygems.org