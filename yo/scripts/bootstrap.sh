#!/bin/bash
if [[ "$DOCKER_USER_UID" != "0" ]]; then
  groupadd -g $DOCKER_USER_GID dummy_group
  useradd -Mu $DOCKER_USER_UID -g dummy_group -d $DOCKER_USER_HOME dummy_user

  echo "Running as $DOCKER_USER_NAME: $@"
  su dummy_user -c '"$0" "$@"' -- "$@"
fi
