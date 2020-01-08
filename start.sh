#!/bin/bash

export MIX_ENV=prod
export PORT=3829

echo "Stopping old copy of app, if any..."

_build/prod/rel/task_tracker2/bin/task_tracker2 stop || true

echo "Starting app..."

# Foreground for testing and for systemd
_build/prod/rel/task_tracker2/bin/task_tracker2 foreground

