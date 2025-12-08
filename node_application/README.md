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

