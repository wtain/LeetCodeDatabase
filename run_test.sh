#!/bin/bash


#function getContainerHealth {
#  docker inspect --format "{{.State.Health.Status}}" $1
#}
#
#function waitContainer {
#  while STATUS=$(getContainerHealth $1); [ $STATUS != "healthy" ]; do
#    if [ $STATUS == "unhealthy" ]; then
#      echo "Failed!"
#      exit -1
#    fi
#    printf .
#    lf=$'\n'
#    sleep 1
#  done
#  printf "$lf"
#}

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

echo "Waiting for database to start..."
while ! curl --http0.9 localhost:3306 --output -; do
  sleep 1
done
echo "Started"

# waitContainer "${container}"

# docker exec -it ${container} bash -c 'mysql -h 127.0.0.1 -u root -psecret --database example --batch -e "select * from Products"'  > sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//' > output.csv

# docker exec -it ${container} bash -c 'mysql -h localhost -u root -psecret --database example --batch -e "select * from Products"' > output.csv

docker exec -it ${container} bash -c 'mysql -h localhost -u root -psecret --database example <Solution.sql' > output.csv

echo "Solution output:"
cat output.csv

docker-compose down