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