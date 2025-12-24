# Docker-Kubernetes
Checking in my learning notes related to Docker, Docker compose, Multi-container projects, Deployment and all about kubernetes from the ground up

## Important Note
>
>   ```Use bind mounts only during development and shouldn't be used during deployments as containers should be self serving```
>

## Development to Production: Things to watchout for
>
> 1. Bind Mounts shouldn't be used in production.
> 2. Containerized apps might need a build step (e.g. react apps).
> 3. Multi-container projects might need to be split (or should be split) across multiple hosts / remote machines.
> 4. Trade-offs between control and responsibility  might be worth it!
>
