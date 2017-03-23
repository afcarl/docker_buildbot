# docker_buildbot
Minimal example of getting buildbot and docker to play nicely together

## Build the containers

Run the following::

    # Build the master image
    cd master
    docker build -t bb-master . 

    # Build the slave image
    cd ../slave
    python inject $(docker-machine ip) && docker build -t bb-slave .
    
## Fire up the containers

Run the following (``-p 8010:8010`` says map host port 8010 to the VM port 8010)::

    docker run -i -t -d -p 8010:8010 -p 9989:9989 bb-master
    docker run -i -t -d bb-slave

Test you can get something from the container::

    curl $(docker-machine ip):8010

Go to the url ``$(docker-machine ip):8010`` in the browser (on linux, this is simply localhost:8010, but on OSX, container runs in a VM, with an IP given by DHCP)

## Other useful stuff:

Remove all stopped containers (from https://coderwall.com/p/ewk0mq/stop-remove-all-docker-containers)::

    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
