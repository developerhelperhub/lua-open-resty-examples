mkdir -p ssl

# Generate a private key
openssl genrsa -out ssl/server.key 2048

# Generate a self-signed certificate
openssl req -new -x509 -key ssl//server.key -out ssl/server.crt -days 365 -subj "/CN=localhost"