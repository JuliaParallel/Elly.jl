# Elly

[![Build Status](https://travis-ci.org/tanmaykm/Elly.jl.svg?branch=master)](https://travis-ci.org/tanmaykm/Elly.jl)

Elly is a [Hadoop](https://hadoop.apache.org/) HDFS and Yarn client.

- Has a familiar Julia IO API for HDFS files.
- Has a generic Yarn Client and Yarn Application Master that provide the scaffolding for writing Yarn applications.
- It is pure Julia and hence is easier to setup (does not have any dependency on `libhdfs`).
- But can be used only with Hadoop 2.x since it communicates with its newer protobuf interface.

## Using Elly

Elly does not read Hadoop configuration files directly. But there are only few configuration items that it needs 
right now and they are accepted during object initialization - the network address (host and port) of the 
corresponding Hadoop service and an optional `UserGroupInformation` object that represents the Hadoop user.

Only simple authentication is supported as of now.

- [HDFS using Elly](HDFS.md)
- [Yarn using Elly](YARN.md)
- [Yarn Cluster Manager](YARNCM.md)
