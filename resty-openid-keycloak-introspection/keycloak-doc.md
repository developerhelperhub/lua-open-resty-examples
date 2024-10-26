

docker run -d --name keycloak -p 8084:8080 \
  -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin \
  quay.io/keycloak/keycloak:latest \
  start-dev

realm name : mes-application

Client Id : openresty-api-gateway
    Client Type: OpenID Connect
    Client Name: Openresty OpenId API Gateway
    Client authentication: On
    Authentication Flow: Direct access grants


Crdential:
    Client Authenticator: ClientID and Secrete
    Client Secret: B0rxAinZBXlvBhIotrCUpBADLC1q9bgw

Create User:
    Required Uer Actions: Verify Email
    Email Verified: On
    Username: myuser
    Email: myuser@mail.com
    First name: My
    Last name: User

Note: if we are not set the email, first name and last name, while get token, we will get error "Account is not fully set up [invalid_grant]"
    
Credential:
    Password: Admin
    Temporary: Off



curl http://192.168.29.230:8084/realms/mes-application/.well-known/openid-configuration
curl http://127.0.0.1:8084/realms/mes-application/.well-known/openid-configuration
curl http://localhost:8084/realms/mes-application/.well-known/openid-configuration



curl -X POST "http://127.0.0.1:8084/realms/mes-application/protocol/openid-connect/token/introspect" \
     -d "token=eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4Q3dZcVpaRURjR2hSTk84YXZqLWM3OTVTcUUtUDRMRFBGQzlxWGRUS01vIn0.eyJleHAiOjE3Mjk5NjY2NTAsImlhdCI6MTcyOTk2NjM1MCwianRpIjoiNGY0MDA3N2QtMWI2OC00NzJiLWIyYzgtNGRhNmFiMjllZjRmIiwiaXNzIjoiaHR0cDovLzEyNy4wLjAuMTo4MDg0L3JlYWxtcy9tZXMtYXBwbGljYXRpb24iLCJhdWQiOiJvcGVucmVzdHktYXBpLWdhdGV3YXkiLCJzdWIiOiIzOGI3ZjQxYS0wMThiLTQ2MGYtYmM3Ni00ODU4ZTU0ZDlhMjYiLCJ0eXAiOiJJRCIsImF6cCI6Im9wZW5yZXN0eS1hcGktZ2F0ZXdheSIsInNpZCI6IjllNTY4NTRhLTRlMDMtNDQ3Ni05ZmMwLTg2YzUyODJmNTM2ZCIsImF0X2hhc2giOiI1eml6eEpNUHVtSVhwYU1wR2xXQjlBIiwiYWNyIjoiMSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiTXkgVXNlciIsInByZWZlcnJlZF91c2VybmFtZSI6Im15dXNlciIsImdpdmVuX25hbWUiOiJNeSIsImZhbWlseV9uYW1lIjoiVXNlciIsImVtYWlsIjoibXl1c2VyQG1haWwuY29tIn0.R4_IYZiCIlDxna3EovxNKPSqAvQBoD4mQsKWz2ysLJE-QCFchCcUmlNe8Trw1-fIOsXk894XZAtqgkp0tiM9bl9RtWUS4hp-SBhTYF2iHCFwev0Xy9VdwPRrcXISiP3kEgaCbFckR3TP7Ea3zFAMbILdx_odeXAkXDqSVVHD2wiBEYj7gXt7Tt1NTKiFa9wIjG3rVpIyMP2ev7RwtfAJDh62ejYKVc_IxvAgkTAqaqj2bOeyZK4KYMFcx6h1rKRowTJyBbMGXq23Gpdue56phErpBzYItcWo8_b-7f1ZaaTJkbyU-sHSBpoEata5X8dzUCbTk8tg2AEUHsyL8LRxvQ" \
     -u "openresty-api-gateway:B0rxAinZBXlvBhIotrCUpBADLC1q9bgw"