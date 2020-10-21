const CONTAINER_ID_BITMASK = 0xffffffffff
const CONTAINER_ID_SPLITTER = '_'
const CONTAINER_PREFIX = "container"
const EPOCH_PREFIX = "e"

parse_container_id() = parse_container_id(ENV["CONTAINER_ID"])

function parse_container_id(cidstr::String)
    parts = split(cidstr, CONTAINER_ID_SPLITTER)
    partidx = 1
    (parts[partidx] == CONTAINER_PREFIX) || error("Invalid ContainerId prefix: $cidstr")
    partidx += 1
    epoch_or_ts = parts[partidx]
    epoch = Int64(0)
    appid = Int32(0)
    clusterts = Int64(0)
    if startswith(epoch_or_ts, EPOCH_PREFIX)
        epoch = parse(Int64, epoch_or_ts[2:end])
        partidx += 1
        clusterts = parse(Int64, parts[partidx])
        partidx += 1
        appid = parse(Int32, parts[partidx])
    else
        clusterts = parse(Int64, epoch_or_ts)
        partidx += 1
        appid = parse(Int32, parts[partidx])
    end
    partidx += 1
    attemptid = parse(Int32, parts[partidx])
    partidx += 1
    cid = parse(Int64, parts[partidx])
    cid = (epoch << 40) | cid

    appid_proto = ApplicationIdProto(; id=appid, cluster_timestamp=clusterts)
    attemptid_proto = ApplicationAttemptIdProto(; application_id=appid_proto, attemptId=attemptid)
    ContainerIdProto(; app_id=appid_proto, app_attempt_id=attemptid_proto, id=cid)
end

function container_id_string(cid::ContainerIdProto)
    app_id = hasproperty(cid, :app_id) ? cid.app_id : cid.app_attempt_id.application_id
    attempt_id = hasproperty(cid, :app_attempt_id) ? cid.app_attempt_id.attemptId : 0
    id = cid.id
    epoch = id >> 40
    id = CONTAINER_ID_BITMASK & id

    parts = [CONTAINER_PREFIX]
    (epoch > 0) && push!(parts, EPOCH_PREFIX * lpad(epoch, 2, "0"))
    push!(parts, string(app_id.cluster_timestamp))
    push!(parts, lpad(app_id.id, 4, "0"))
    push!(parts, lpad(attempt_id, 2, "0"))
    push!(parts, lpad(id, 6, "0"))
    join(parts, CONTAINER_ID_SPLITTER)
end
