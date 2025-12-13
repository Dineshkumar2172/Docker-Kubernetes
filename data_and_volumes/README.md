# Notes

## Module Content - Managing Data & Working With Volumes

>
> Understanding different kinds of data
>
> Images, containers and volumes
>
> Using arguments & Environment Variables
>

## Understanding different kinds of data
### Application (Code + Environment)

>
> Written & provided by us (= the developer).
>
> Added to image and container in build phase.
>
> "Fixed": Can't be changed once image is built.
>
> Read-only, hence stored in images.
>

### Temporary App Data (e.g. entered user input)

>
> Fetched / Produced in running container
>
> Stored in memory or temporary files
>
> Dynamic and changing, but cleared regularly
>
> Read + write, temporary, hence stored in containers
>

### Permanent App Data (e.g. user accounts)

>
> Fetched / Produced in running container.
>
> Stored in files or a database.
>
> Must not be lost if container stops / restarts
>
> Read + Write, permanent, stored with containers & volumes
>

## Volumes and Bind Mounts

>
> anonymous volumes (we don't know where its mounted and don't know which volume belongs to use as it's named automatically)
>
>```docker run -v /app/data```
>
> named volumes (we don't know where its mounted but we can identify which volume belongs to us as it's custom named)
>
>```docker run -v data:/app/data```
>
> Bind Mounts (we know where it's mounted and takes given path as a name) - takes absolute path
>
>```docker run -v /absolute/path/to/code:/app/code```
>

### Anonymous Volumes

>
> 1. Created specifically for a single container.
>
> 2. Survives container shutdown / restart unless -rm is used.
>
> 3. Can not be shared across containers.
>
> 4. Since it's anonymous, it can't be re-used (even on same image).
>
> 5. Can either create using ```VOLUME``` instruction in dockerfile or created during with -v during docker run command.
>
> 6. Can be useful for locking in certain data which already exists in a container.
>

a quick note on anonymous volumes
```
Anonymous volumes live as long as the container exists.

Stop/restart → volume stays.

Remove container → volume is removed.
```

### Named Volumes

>
> 1. Created in general - not tied to any specific container.
>
> 2. Survives container shutdown / restart - removal via Docker CLI. ```docker volume prune```
>
> 3. Can be shared across containers.
>
> 4. Can be re-used for same containers (across restarts).
>
> 5. Cannot be created through dockerfile, can only be created through -v instruction when running a container.
>

### Bind Mounts

>
> 1. Location on host file system, not tied to any specific container.
>
> 2. Survives container shutdown / restart - in order to remove bind mount we have to remove it on host fs. There is no separate docker cli command as docker doesn't own it.
>
> 3. Can be shared across containers.
> 
> 4. Can be re-used for same containers (across restarts)
>

## Arguments & Environment Variables

Docker supports build time arguments and runtime environment variables.

>
> 1. ARG: 
> ```
>
>   Available inside of Dockerfile, NOT accessible in CMD or any application code.
>   
>   Set on image build (docker build) via --build-arg
>
> ```    
> 
> 2. ENV:
> ```
>   
>   Available inside of Dockerfile & in application code.
>
>   Set via ENV in Dockerfile or via --env on docker run.
>
>   NOTE: env variable set via docker run overrides the same env variable set on Dockerfile. Good approach is to set default argument inside dockerfile and use it as part of environment variable.
>
> ```
>


## Additional Note

We can use ```.dockerignore``` file to ignore files to be copied from host machine to inside image during image build. (```COPY . .``` instruction)