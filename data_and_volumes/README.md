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
> anonymous volumes (we don't know where its mounted and don't know which volume belongs to use as it's named automatically) - ```docker run -v /app/data```
>
> named volumes (we don't know where its mounted but we can identify which volume belongs to us as it's custom named) - ```docker run -v data:/app/data```
>
> Bind Mounts (we know where it's mounted and takes given path as a name) - takes absolute path - ```docker run -v /absolute/path/to/code:/app/code```
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

