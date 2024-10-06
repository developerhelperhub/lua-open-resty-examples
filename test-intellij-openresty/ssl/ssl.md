mkdir -p /etc/nginx/ssl

# Generate a private key
openssl genrsa -out /etc/nginx/ssl/server.key 2048

# Generate a self-signed certificate
openssl req -new -x509 -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -days 365 -subj "/CN=example.com"