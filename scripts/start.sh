#!/bin/sh
# Wait for Postgres to be ready, then migrate, seed, and start
echo "Waiting for database..."
for i in 1 2 3 4 5 6 7 8 9 10; do
  npx prisma migrate deploy 2>&1 && break
  echo "Attempt $i failed, retrying in 5s..."
  sleep 5
done

echo "Running seed..."
node prisma/seed.js

echo "Starting server..."
node src/server.js
