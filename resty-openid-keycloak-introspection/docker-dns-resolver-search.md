To check your local Docker server's DNS resolver configuration, you can inspect the /etc/resolv.conf file inside a Docker container or look at how Docker itself handles DNS resolution for containers.

Here are a few steps you can follow to verify the DNS resolver used by Docker:

1. Check DNS Resolver in a Running Docker Container
Docker uses the /etc/resolv.conf file inside each container to configure DNS settings. You can inspect this file to see which DNS server the container is using:

Start or identify a running container:

bash
Copy code
docker ps
Use the docker exec command to access the container's /etc/resolv.conf file:

bash
Copy code
docker exec -it <container-name> cat /etc/resolv.conf
Example output:

bash
Copy code
nameserver 127.0.0.11
options ndots:0
In most cases, Docker uses 127.0.0.11 as the internal DNS resolver, which forwards DNS queries to the host's DNS servers.

2. Inspect Docker's DNS Configuration for All Containers
You can also inspect Docker's default DNS settings by running the following command on your host system:

bash
Copy code
docker network inspect bridge
This command will show details about the default Docker bridge network. Look for the "DNS" section in the output:

json
Copy code
{
    "Name": "bridge",
    "Id": "...",
    "Created": "...",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
        "Driver": "default",
        "Options": null,
        "Config": [
            {
                "Subnet": "172.17.0.0/16",
                "Gateway": "172.17.0.1"
            }
        ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
        "Network": ""
    },
    "ConfigOnly": false,
    "Containers": {
        ...
    },
    "Options": {
        "com.docker.network.bridge.default_bridge": "true",
        "com.docker.network.bridge.enable_icc": "true",
        "com.docker.network.bridge.enable_ip_masquerade": "true",
        "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
        "com.docker.network.bridge.name": "docker0",
        "com.docker.network.driver.mtu": "1500"
    },
    "Labels": {}
}
The DNS section will provide the list of DNS servers that the Docker containers use for domain name resolution.

3. Check DNS Settings for a Specific Docker Network
If your container is using a custom network, you can check the DNS settings for that network by running:

bash
Copy code
docker network inspect <network-name>
4. Check Docker Daemon DNS Settings (If Custom Configured)
If you have explicitly configured DNS for your Docker daemon, it would be set in Docker's daemon configuration file (/etc/docker/daemon.json). Here's how you can check it:

Check the daemon.json file:

bash
Copy code
cat /etc/docker/daemon.json
Example output:

json
Copy code
{
  "dns": ["8.8.8.8", "8.8.4.4"]
}
If the dns option is configured, Docker will use these DNS servers for all containers.

If this file does not exist or the dns setting is missing, Docker defaults to using the DNS servers in your system’s /etc/resolv.conf file.

5. Test DNS Resolution from the Container
To check if DNS resolution works properly from within the container, you can use nslookup or dig (if available):

Enter the running container:

bash
Copy code
docker exec -it <container-name> /bin/bash
Use nslookup or dig to resolve a domain:

bash
Copy code
nslookup google.com
or

bash
Copy code
dig google.com
This will show you which DNS server the container is using and whether it can resolve domains correctly.

Summary:
Use docker exec to inspect /etc/resolv.conf inside your containers to see the DNS server Docker is using (typically 127.0.0.11).
Run docker network inspect bridge to inspect Docker’s default network DNS configuration.
Check if custom DNS servers are set in /etc/docker/daemon.json on your host.
Test DNS resolution inside the container with nslookup or dig.
Let me know if you need further clarification or assistance!