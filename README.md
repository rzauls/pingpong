# README

Example of a github action workflow that builds an application container, pushes it to a registry, and deploys it on multiple target servers, using an `entry` server as a secure passthrough to internal networks.


# USAGE


1. Set up docker registry credentials in the gh secrets (REGISTRY_URL, REGISTRY_USERNAME, REGISTRY_PASSWORD)
1. Have an `entry` server (hostname/ip should be added to github secrets as `ENTRY_HOST`)
1. Log into the entry server with ssh, using a key (add this one to github secrets as `SSH_PRIVATE_KEY`) - and generate a new keypair for use in entry->node communication
1. Add this new entry->node key to each target node so gh actions can log into them. It is named `entry_key` in the workflow example (`/home/.ssh/entry_key`)
1. Add target node hostnames/addreses to gh actions workflow in the following format:

```json
[
{"target": <ip_addr/hostname>},
{"target": <ip_addr/hostname2>},
{"target": <ip_addr/hostname3>},
...
]
```

Inline and escape this JSON structure as env.TARGET_NODES variable in the workflow definition.
1. Run the pipeline and it should work.
