#!/bin/sh
echo 'starting worker'
exec buildbot-worker restart --nodaemon /root/worker
