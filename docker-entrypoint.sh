#!/bin/bash


echo "127.0.0.1 release.gitkraken.com" >> /etc/hosts

uid=${UID:-1000}
gid=${GID:-1000}

# Create a user based on the UID and GID passed as environment variables
if [ -n "$UID" ] && [ -n "$GID" ]; then
    groupadd -g $uid usergroup
    useradd -u $uid -g $gid -ms /bin/bash user
    export HOME=/home/user
    chown -R $uid:$gid /home/user
    exec gosu user "$@"
else
    exec "$@"
fi
