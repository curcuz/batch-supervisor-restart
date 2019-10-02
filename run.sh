#!/usr/bin/env bash

# shellcheck disable=SC2002
cat batch | stdbuf -oL xargs -I{} -P 30 /bin/sh -c "cat task.sh | ssh -p 22222 root@{} | sed 's/^/{} : /' | tee -a task.log"
