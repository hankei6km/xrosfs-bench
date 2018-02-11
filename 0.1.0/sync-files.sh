#!/bin/sh
#
# Copyright (c) 2018 hankei6km
# Licensed under the MIT License. See LICENSE.txt in the project root.

set -e

# https://stackoverflow.com/questions/242538/unix-shell-script-find-out-which-directory-the-script-file-resides
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "${0}")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "${SCRIPT}")

SETUP_SCRIPTS_PATH="${SCRIPT_PATH}/setup-scripts"
for variant in "${SCRIPT_PATH}"/* ; do
  if [ -f "${variant}/bench/Dockerfile" ] ; then
    [ -d "${variant}/bench/setup-scripts" ] || mkdir "${variant}/bench/setup-scripts"
    cp "${SETUP_SCRIPTS_PATH}"/* "${variant}/bench/setup-scripts" 
  fi
done
