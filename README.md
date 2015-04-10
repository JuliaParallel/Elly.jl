# Elly

Elly is a [Hadoop](https://hadoop.apache.org/) HDFS and Yarn client. It provides:

- A familiar Julia `ClusterManager` interface, making it possible to
  use the familiar Julia parallel constructs on any Hadoop/Yarn
  cluster: `addprocs`, `@parallel`, `spawn`, `pmap`, etc.
- Lower level APIs to write native Yarn applications.
- A familiar Julia IO API for accessing HDFS files. It is a pure Julia
  implementation with no dependencies on `libhdfs`.

# Requirements
- Since Elly uses the newer Protobuf interface, it requires a Hadoop 2.2+ distribution.

# Using Elly

- [HDFS using Elly](HDFS.md)
- [Yarn Applications using Elly](YARN.md)
- [Julia Cluster Manager for Yarn](YARNCM.md)
