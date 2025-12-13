# NOTES

## CASE 1: Container to WWW Communicati

Container support this by design. Nothing to do explicitly to communicate to web services.

## CASE 2: Container to Local Host Machine

```host.docker.internal``` - this special domain have be used in order to access services running on host machine from within container.

## CASE 3: Container to Container Communication

Assume your application container want's to communicate with the mongodb container running separately. Inspect the mongo db container using ```docker inspect <container-id>``` and check for IPAddress in networks section and use it to communicate with the mongo db container from within application container.

But it's not convenient as we need to lookup an ip address every time we bring up a new container from an image. Also hardcoding ip address of mongo db container within application container makes it even more not so ideal way to implement cross container communication. Below is the elegant way of doing it.

>
> step 1: Create a docker internal network and give it a time using ```docker network create <network-name>```
>
> step 2: Run both application and mongo container inside this same network using 
> 
> ```docker run -d --name <container-name> --network <network-name> <image>```
> 
> step 3: Now use the mongo container's name as a hostname to communicate with it from withing application container.
>

Basically, when multiple containers are running in a same network, they can communicate with each other using their respective container names. Addition to that, when multiple containers are running in a same network, we don't need to expose their port using -p flag for any of them as container belonging to same network can communicate with each other right away without having to explicitly expose their port. In our case, mongo container doesn't need to be exposed outside the specified network as only application container will be accessing it sitting inside the same network. In case if we wanna access this mongo container from outside it's network, then it has to be exposed. So in this scenario, we expose only application container port as we'll be consuming it and don't expose mongo port as application sitting inside the same network will be the one communicating with it.
