#!/bin/bash
#this script moves the expired dynamic events from the master table to the history

#call something like this
psql -d $PGDATABASE -U $OPENSHIFT_POSTGRESQL_DB_USERNAME -w -f $OPENSHIFT_REPO_DIR/.openshift/cron/weekly/move_to_history.sql

