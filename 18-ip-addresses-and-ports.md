# IP Addresses and Ports

## Introduction
IP addresses identify network interfaces at the IP layer, while ports identify transport-layer endpoints used by applications.

## Definition
IPv4 addresses are 32 bits and IPv6 addresses are 128 bits. TCP and UDP ports are numeric identifiers used to direct traffic to an application endpoint on a host.

## How It Works
A client sends packets to a destination IP address. The network routes packets toward that address, and the transport protocol and destination port help deliver data to the appropriate socket. Routing and firewall rules must allow the path.

## Important Components
- **IPv4:** 32-bit address format.
- **IPv6:** 128-bit address format.
- **CIDR:** Notation for a network prefix, such as `/24`.
- **Private address:** Address intended for private network use.
- **Port:** Transport endpoint number, from 0 through 65535.

## Real-World Example
A web server might accept HTTPS on TCP 443, while a MySQL server listens on TCP 3306 only on a private interface and allows traffic from approved application hosts.

## Why DevOps Engineers Need This
Correct IPs, routes, listening sockets, and firewall rules are crucial for cloud security groups, service discovery, and application connectivity.

## Diagram
```mermaid
flowchart LR
 A[Client IP: ephemeral port] --> B[Destination IP: service port]
 B --> C[Firewall and route checks]
 C --> D[Listening socket]
```

## Linux Commands and Examples
### `ip addr`
Show local addresses.

```bash
ip addr
```

### `ip route`
Show routing table.

```bash
ip route
```

### `ss -tuln`
Show listening TCP and UDP sockets.

```bash
ss -tuln
```

### `getent hosts example.com`
Resolve a hostname.

```bash
getent hosts example.com
```

Some commands may not be installed in a minimal environment. Output and available options vary by distribution and machine.

## Troubleshooting Scenarios
Check the destination IP and port, name resolution, route, firewall/security-group rules, and whether a service is listening. A port number is only a convention; it does not prove which application owns it.

## Hands-On Lab
Run `ip addr`, `ip route`, and `ss -tuln`. Identify one local address and one listening port if present. Explain what evidence is needed to verify remote reachability.

## Interview Questions and Answers
### 1. How many bits are in IPv4?
32 bits.

### 2. How many bits are in IPv6?
128 bits.

### 3. What does `/24` mean in IPv4 CIDR?
The first 24 bits are the network prefix.

### 4. Does a port number guarantee a service is running?
No; verify that a socket is listening and that the service is healthy.

### 5. What does `ss -tuln` do?
Lists listening TCP and UDP sockets using numeric addresses and ports.

## Practice Assignment
For a hypothetical web tier and database tier, propose which ports should be reachable between components and which should not be publicly exposed.

## Key Takeaways
- IP addresses identify network interfaces at the IP layer, while ports identify transport-layer endpoints used by applications.
- Understand the components and how to inspect them safely.
- Gather evidence before making changes.
- Connect this concept to production reliability and security.

## Further Learning
Subnetting, routing, firewalls, security groups, HTTP/HTTPS.
