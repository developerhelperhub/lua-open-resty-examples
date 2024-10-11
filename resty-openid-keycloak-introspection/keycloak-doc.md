

realm name : mes-application

Client Id : openresty-api-gateway
    Client Type: OpenID Connect
    Client Name: Openresty OpenId API Gateway
    Client authentication: On
    Authentication Flow: Direct access grants


Crdential:
    Client Authenticator: ClientID and Secrete
    Client Secret: VdWM6SfXqdSpheZKuALL1ur59P6XgGoK

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