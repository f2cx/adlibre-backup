#!/usr/bin/env bash

# Adlibre Backup - Execute this as cronjob

CWD="$(dirname $0)/"

# Source Config
. ${CWD}../etc/backup.conf

# run the backup runner and prune old backups
(${CWD}backup-runner.sh --all --comment "Backup Daily" && ${CWD}prune.sh --all; echo ""; echo ""; /sbin/zpool status ) | /usr/bin/mailx -s "[`hostname`] Daily Backup Summary" root
