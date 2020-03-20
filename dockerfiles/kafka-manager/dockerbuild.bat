docker build --rm -f ./Dockerfile -t docker.flexem.com/library/kafka-manager:2.0.0 .

echo kafka-manager project build ok!!

docker push docker.flexem.com/library/kafka-manager:2.0.0

echo docker push to docker.flexem.com/library/kafka-manager ok!!

pause