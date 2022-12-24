# Non-root port forwarding

Due to not being identified by name, I had to use **PF**

This image uses `socat` to forward network traffic as defined by the environment variables.

## Usage

Define the following environment variables to configure port-forwarding.

Variable | Description | Optional
-------- | ----------- | --------
REMOTE_HOST | IP or address of the host you want to forward traffic to | no
REMOTE_PORT | Port on remote host to forward traffic to | yes (Default 1080)
LOCAL_PORT | Port where container listens. Must be **non-privileged** (i.e. >1024) | yes (Default 1080)

## Docker hub

My Docker at Docker Hub: [jepbura/pf](https://hub.docker.com/r/jepbura/pf/)

Based on [marcnuri/port-forward](https://hub.docker.com/r/marcnuri/port-forward)
And
Based on [ministryofjustice/port-forward](https://hub.docker.com/r/ministryofjustice/port-forward)