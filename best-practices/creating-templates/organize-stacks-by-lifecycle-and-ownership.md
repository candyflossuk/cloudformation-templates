# Organize Stacks By Lifecylce and Ownership
[Adapted from AWS Documentation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/best-practices.html#organizingstacks)

* Use lifecycle and ownership of AWS resources to decide what resources go in each stack.
* Managing a single stack is cumbersome
* Group resources with common lifecycles and ownership. Owners can manage their own process and schedule - without affecting other resources in the stack

## An Example
* Developers and engineers manage a website hosted on auto scaling instances behind a load balancer.
* Website has its own lifecycle - maintained by website team
* Database admins maintain the back end databases
* As there is no hard dependancy between the two - co ordinating and communicating updates is easier.

## Layered Architecture
* Layered architecture organizes stacks into multiple horizontal layers that build on top of each other.
* Each layer has dependancy on layer directly below it
* One ore more stacks in each layer is allowed - however stacks should have AWS resources with similar lifecycles and ownership

## Service Orientated architecture
* With SOA you can organize big business problems into manageable parts.
* Each service has a clearly defined purpose and represents a self-contained unit of functionality.
* Services can be mapped to a stack - with its own lifecycle and owners.
* All services can be wired together to interact
