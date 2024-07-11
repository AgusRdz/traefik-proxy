# Environment Setup with Traefik

This document describes how to configure your environment to use Traefik as a reverse proxy handling HTTPS connections. Ensure you have `docker-compose` installed to execute the following steps.

## Configuration Steps

### 1. Configure Traefik

1. Navigate to the `traefik` directory and run `docker-compose up -d` to start Traefik:

    ```sh
    cd traefik
    docker-compose up -d
    ```

2. Certificates can be added or removed in `traefik/config/dynamic.yml` as needed (make sure they are also updated in the environment of the `mkcert` service).

### 2. Configure Other Services

1. Navigate to the `whoami` directory and run `docker-compose up -d` to start the `whoami` service:

    ```sh
    cd whoami
    docker-compose up -d
    ```

2. For the Laravel services (`laravel1`, `laravel2`, `laravel3`), navigate to each of their directories and run `make install` to install dependencies and set up the environment:

    ```sh
    cd laravel1
    make install

    cd ../laravel2
    make install

    cd ../laravel3
    make install
    ```

    Each Laravel application has its Nginx configuration in `docker/nginx/default.conf`.

### 3. Modify the Hosts File

To properly route the domains to your local environment, add the following entries to your `hosts` file:

  ```sh
    127.0.0.1       traefik.home.com
    127.0.0.1       whoami.home.com
    127.0.0.1       laravel1.home.com
    127.0.0.1       laravel2.home.com
    127.0.0.1       laravel3.home.com
  ```

### 4. Add Certificates to Trusted Certificates Store

To avoid security warnings in your browser, you need to add the `.pem` certificate to your trusted certificates store.

- **On macOS**: Open the `.pem` file with Keychain Access and add it to your System or Login keychain. Make sure to mark the certificate as trusted.
- **On Windows**: Run `certutil -addstore -f "ROOT" example.com+1.pem` in the command line as an administrator.
- **On Linux**: The method to add trusted certificates may vary by distribution. A common approach is to copy the `.pem` file to `/usr/local/share/ca-certificates/` and then run `sudo update-ca-certificates`.