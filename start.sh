#!/bin/sh
set -e

# Warte bis Postgres erreichbar
while ! nc -z postgres 5432; do
  echo "Waiting for postgres..."
  sleep 1
done

echo "Starting Etherpad..."
