#!/bin/sh
set -e

# Clean up Apache PID files to prevent "already running" errors
rm -f /var/run/apache2/apache2.pid \
      /opt/omd/sites/monitoring/tmp/apache/run/apache*.pid 2>/dev/null || true

echo "Apache PID files cleaned up successfully" 