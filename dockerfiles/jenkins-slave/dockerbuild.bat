set ver=0.1.0

docker build --rm -f ./Dockerfile -t docker.flexem.com/library/jenkins-slave:%ver% .

echo jenkins-slave project build ok!!

docker push docker.flexem.com/library/jenkins-slave:%ver%

echo docker push to docker.flexem.com/library/jenkins-slave ok!!

pause