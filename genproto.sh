#!/usr/bin/env bash

HADOOP_SRC=
PROTOC_PATH=
OUT_PATH=
if [ $# -lt 2 ]
then
    echo "Usage: $0 <path to hadoop sources> <output folder> [path to protoc]"
    exit 1
else
    HADOOP_SRC=$1
    OUT_PATH=$2
    HADOOP_SRC=${HADOOP_SRC%%/}
fi
echo "Looking for Hadoop sources at ${HADOOP_SRC}"

if [ $# -gt 2 ]
then
    PROTOC_PATH=$2
    PROTOC_PATH=${PROTOC_PATH%%/}
fi

HADOOP_COMMON_PROTO=${HADOOP_SRC}/hadoop-common-project/hadoop-common/src/main/proto
HADOOP_HDFS_PROTO=${HADOOP_SRC}/hadoop-hdfs-project/hadoop-hdfs/src/main/proto
HADOOP_MR_PROTO=${HADOOP_SRC}/hadoop-mapreduce-project/hadoop-mapreduce-client/hadoop-mapreduce-client-common/src/main/proto
HADOOP_YARN_PROTO=${HADOOP_SRC}/hadoop-yarn-project/hadoop-yarn/hadoop-yarn-api/src/main/proto

PROTOC_INCLUDES="-I=${HADOOP_COMMON_PROTO} -I=${HADOOP_HDFS_PROTO} -I=${HADOOP_MR_PROTO} -I=${HADOOP_YARN_PROTO}"

PROTO_FILES=

for proto_file in ProtobufRpcEngine RpcHeader Security IpcConnectionContext
do
    PROTO_FILES="${PROTO_FILES} ${HADOOP_COMMON_PROTO}/${proto_file}.proto"
done

for proto_file in datatransfer hdfs ClientNamenodeProtocol
do
    PROTO_FILES="${PROTO_FILES} ${HADOOP_HDFS_PROTO}/${proto_file}.proto"
done

for proto_file in yarn_protos yarn_service_protos applicationmaster_protocol applicationclient_protocol containermanagement_protocol application_history_client
do
    PROTO_FILES="${PROTO_FILES} ${HADOOP_YARN_PROTO}/${proto_file}.proto"
done

echo "Proto files: ${PROTO_FILES}"

echo "Generating Julia sources..."
${PROTOC_PATH}protoc ${PROTOC_INCLUDES} --julia_out=${OUT_PATH} ${PROTO_FILES}
#echo "Generating Java sources..."
#protoc ${PROTOC_INCLUDES} --java_out=${OUT_PATH} ${PROTO_FILES}
