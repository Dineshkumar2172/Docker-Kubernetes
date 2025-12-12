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
