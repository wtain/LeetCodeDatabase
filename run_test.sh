#!/bin/bash

function waitForMySQL() {
  echo "Waiting for database to start..."
  i=0
  while ! curl --http0.9 localhost:3306 --output -; do
    ((i++))
    echo "Attempt $i failed. Sleeping 1 second"
    if (( i >= 10 )); then
      echo "Failed after $i attempts"
      exit 1
    fi
    sleep 1
  done
  echo "Started"
}

function runScript() {
  container=$1
  file_name=$2
  docker exec -it ${container} bash -c 'mysql -h localhost -u root -psecret --database example <Solution.sql' > "${file_name}"
}

if [ $# -lt 1 ]; then
  echo 'USAGE'
  echo './run_test.sh [solution_dir]'
  exit 1
fi

export solution_dir=$1

echo "Running tests for ${solution_dir}"
docker-compose up -d

container=$(docker-compose ps -q)

echo "Container: ${container}"


waitForMySQL

runScript "${container}" "output.csv"

echo "Solution output:"
cat output.csv

docker-compose down