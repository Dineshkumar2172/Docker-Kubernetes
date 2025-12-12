### Notes

Different between CMD and RUN in Dockerfile


> ``` RUN - It comes into picture when image is getting created ```
>
> ``` CMD - It comes into picture when container is getting started ```

What are Layers in the context of images?

> ``` Every instruction in an image creates a cacheable layer - layers help with image re-building and sharing ```

Mapping multiple host port with single container port

```
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker run -p 8001:80 -p 8002:80 -p 8003:80 -p 8004:80 -d 1e27c7928f38
e96c97ec9fe556161ca8c81180ec52c8626128e1c1c89f9d27897503cbe0eb08
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker ps                                                             
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                                                                    NAMES
e96c97ec9fe5   1e27c7928f38   "docker-entrypoint.s…"   2 seconds ago   Up 2 seconds   0.0.0.0:8001->80/tcp, 0.0.0.0:8002->80/tcp, 0.0.0.0:8003->80/tcp, 0.0.0.0:8004->80/tcp   strange_hermann
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker rm -f e96c97ec9fe5                                             
e96c97ec9fe5
```

Attaching to an already-running container

> By default, if we run a container without -d, we run in "attached mode".
>
> If we started a container in detached mode (i.e. with -d), we can still attach to it afterwards without restarting the container with the following command
>
> ```docker attach 2e7414ff8105```
>
> attaches us to a container with an ID or name of container.

Remove Images

> We cannot remove images that are currently used by containers. So containers have to be removed before removing an image. Also before removing container, we need to stop it if it's in running state using ```docker stop <container-d>``` and then ```docker rm <container-id>```. (We can use ```docker rm -f <container-d>``` to stop and remove using single command cleanly)
>
> After removing the container, wen can use the command ```docker rmi <image-id>``` to remove a specific image. In order to remove all the unused images - we can use the command ```docker image prune``` - it'll remove all the dangling (images with no tags and not used by any containers) images that are not used by any containers.

Remove Stopped Containers Automatically

> We can use the run command with --rm flag when running a container from an image for automatic removal of the container once it stops.
>
> ```docker run -p 3000:3000 -d --rm <image-id>```

Naming & Tagging Containers and Images

> Can use --name flag to set name while running a container to easily identify container instead of using container-id. Also you can see the container get auto removed after stopping it, with the help of --rm flag which we used while running a container.

```
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker run -p 80:80 -d --rm --name node_application 7285b8400baf
af7ae0371fc677fe88af82bf93718b2f05a80a1f6e2f54dfbd487593a745e501
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker ps 
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                NAMES
af7ae0371fc6   7285b8400baf   "docker-entrypoint.s…"   5 seconds ago   Up 4 seconds   0.0.0.0:80->80/tcp   node_application
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker stop af7ae0371fc6
af7ae0371fc6
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application %
```

> Similarly we can also assign a name for images, but here it is called a tag. Image tag consist of two parts ```<name/repository-of-image>:<tag>```. With the name we can set up a general name of image - define a group of, possible more specialized, images - example: node in node:14. With the tag we can define a specialized image within a group of images - example: 14 in node:14.
>
> Using this, we can name our image, and with the help of tag we can maintain different versions of our image. With combined, we can always have a unique identifier with a very specialized versions of our image. If the image has no tag, name alone can be a unique identifier depends on how you use it.
>
> ```docker build -t node_app:latest .```
>
> If we want to remove all image including tagged images, we need to run ```docker image prune -a```

```
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker build -t node_app:latest .
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
node_app     latest    3d58c13a73ec   2 minutes ago   1.3GB
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker run -p 80:80 -d --rm --name node_application node_app 
45b1d249e3f5c5a44b19644b1d9902f2e0a007162bed1504571266b409c97ec8
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker run -p 8000:80 -d --rm --name node_application2 node_app:latest
8820a1e3721f9e4af58155b47a5d934fd8e3d3816b02d1b37a1876ffea82c407
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS          PORTS                  NAMES
8820a1e3721f   node_app:latest   "docker-entrypoint.s…"   3 seconds ago    Up 2 seconds    0.0.0.0:8000->80/tcp   node_application2
45b1d249e3f5   node_app          "docker-entrypoint.s…"   56 seconds ago   Up 55 seconds   0.0.0.0:80->80/tcp     node_application
(base) dineshkumaranbalagan@Dineshkumars-MacBook-Pro node_application % 
```

An additional note

> For all docker commands where an ID can be used, we don't always have to copy / write out the full id.
>
> We can also just use the first (few) character(s) - just enough to have a unique identifier.
>
> So instead of
>
> ```docker run abcdefg```
>
> we could also run
>
> ```docker run abc```
>
> or, if there's no other image ID starting with "a", we could even run just:
>
> ```docker run a```
>
> This applies to ALL Docker commands where ID's can be used
>

