# Build the master image
cd master
docker build -t bb-master . 

# Build the slave image (with the injected IP addres of the master)
cd ../slave
python inject.py $(docker-machine ip) && docker build -t bb-slave .

## Fire up the containers
docker run -i -t -d -p 8010:8010 -p 9989:9989 bb-master
docker run -i -t -d bb-slave

open http://$(docker-machine ip):8010