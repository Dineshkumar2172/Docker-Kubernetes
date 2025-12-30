# Kubernetes Notes

### Core components

> 
> Cluster - A set of node machines which are running the containerized application (worker nodes) or control other nodes (master nodes).
> 
> Nodes - Physical or virtual machine with a certain hardware capacity which hosts one or multiple pods and communicates with the cluster.
> 
> 1. Master Node - Cluster control plane, managing the pods across worker nodes.
>
> 2. Worker Node - Hosts pods, running app containers (+ resources)
>
> Pods - Pods host the actual running application containers + their required resources (e.g. volumes).
>
> Containers - Normal (Docker) containers
>
> Services - A logical set (group) of pods with a unique, pod- and container- independent IP address.
>