# Networking Fundamentals

## Introduction
Networking allows computers and services to exchange information. Servers rely on networks to serve websites, connect to databases, download packages, and communicate with other systems.

## Definition
A computer network is a set of connected devices that exchange data using agreed protocols.

## How It Works
An application creates data, transport protocols such as TCP or UDP carry it, IP addresses route packets, and local or intermediate network devices forward traffic toward the destination. DNS can translate a human-readable name to an address.

## Important Components
- **IP address:** Identifies an interface at the IP layer.
- **Subnet/CIDR:** Describes an IP address range.
- **DNS:** Resolves names to records such as IP addresses.
- **Router:** Forwards packets between networks.
- **Firewall:** Allows or blocks traffic according to rules.
- **TCP/UDP:** Transport protocols with different behavior.

## Real-World Example
A web VM may have a private IP, a route to a gateway, and firewall rules allowing HTTPS from a load balancer but not directly from every internet host.

## Why DevOps Engineers Need This
VPCs, subnets, routes, security groups, load balancers, Kubernetes networking, and service discovery all depend on networking fundamentals.

## Diagram
```mermaid
flowchart LR
 A[Client] --> B[DNS lookup]
 B --> C[IP address]
 C --> D[Route and firewall]
 D --> E[Server port]
```

## Linux Commands and Examples
### `ip addr`
Show network interfaces and addresses.

```bash
ip addr
```

### `ip route`
Show the routing table.

```bash
ip route
```

### `getent hosts example.com`
Resolve a hostname using system name-service configuration.

```bash
getent hosts example.com
```

### `ping -c 4 1.1.1.1`
Test ICMP reachability; ICMP may be blocked.

```bash
ping -c 4 1.1.1.1
```

### `curl -I https://example.com`
Request HTTP response headers.

```bash
curl -I https://example.com
```

### `ss -tuln`
List listening TCP/UDP sockets.

```bash
ss -tuln
```

Some commands may not be installed in a minimal environment. Output and available options vary by distribution and machine.

## Troubleshooting Scenarios
For a connection failure, verify the hostname resolves, the destination IP and port are correct, routes exist, a service is listening, and firewalls permit traffic. A failed ping alone does not prove a server is down.

## Hands-On Lab
Run `ip addr`, `ip route`, `getent hosts example.com`, and `curl -I https://example.com`. Explain what each command tests.

## Interview Questions and Answers
### 1. What does DNS do?
Resolves domain names to records such as IP addresses.

### 2. What is a router?
A device or function that forwards traffic between networks.

### 3. How do TCP and UDP differ?
TCP is connection-oriented and provides reliable ordered delivery; UDP is datagram-based without TCP's delivery guarantees.

### 4. Does ping prove HTTPS works?
No; ICMP reachability does not test the HTTPS service.

### 5. What does `ss -tuln` show?
Listening TCP and UDP sockets in numeric form.

## Practice Assignment
Create a troubleshooting flowchart for a client that cannot reach a website. Include DNS, routing, firewall, listening port, and application checks.

## Key Takeaways
- Networking allows computers and services to exchange information. Servers rely on networks to serve websites, connect to databases, download packages, and communicate with other systems.
- Understand the components and how to inspect them safely.
- Gather evidence before making changes.
- Connect this concept to production reliability and security.

## Further Learning
IP addresses and ports, HTTP/HTTPS, cloud networking, firewalls.
