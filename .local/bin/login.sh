#!/bin/bash

set -euo pipefail

# Lock      - i3lock -c 000000 -f
# Hibernate - systemctl hibernate
# Restart   - i3 restart
# Exit      - i3-msg exit
# Shutdown  - shutdown now
# Reboot    - reboot

option=$(
    echo -e "Lock\nShutdown\nReboot" \
    | dmenu -i -l 3 -fn "SourceCodeVariable-16"
)

echo $option;

case $option in
    "Lock") echo "Locking...";;
    "Shutdown") echo "Shutting down...";;
    *) echo "Unknown option";;
esac

# dmenu calculator
# press tab to continue with last answer
# xsel -o | dmenu -p Calculate: | xargs echo | bc 2>&1 | dmenu -p Answer: | xsel -i


