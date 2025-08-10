#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid
rm -f /app/tmp/pids/server.pid

# Execute the container's main process (what's set as CMD in Dockerfile)
exec "$@"
