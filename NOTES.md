## Notes

- Elly does not read Hadoop configuration files directly. But there
are only few configuration items that it needs right now and they are
accepted during object initialization - the network address (host and
port) of the corresponding Hadoop service and an optional
`UserGroupInformation` object that represents the Hadoop user.

- Only simple authentication is supported as of now.
