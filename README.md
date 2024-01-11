# Salesforce to Postgres example Meltano project

## Setup

Clone the repo

```sh
# ssh
git@github.com:Matatika/example-salesforce-to-postgres.git

# https
https://github.com/Matatika/example-salesforce-to-postgres.git

cd example-salesforce-to-postgres
```

Create a `.env` file

```env
# required

TAP_SALESFORCE_USERNAME=<username>
TAP_SALESFORCE_PASSWORD=<password>
TAP_SALESFORCE_SECURITY_TOKEN=<security token>

TARGET_POSTGRES_HOST=<host>
TARGET_POSTGRES_USER=<user>
TARGET_POSTGRES_PASSWORD=<password>
TARGET_POSTGRES_DATABASE=<database>

# optional

# defaults to '5432' if not set
# TARGET_POSTGRES_PORT=<port>

# defaults to the name of the tap (i.e. 'tap-salesforce') if not set
# TARGET_POSTGRES_DEFAULT_TARGET_SCHEMA=<schema>
```

## Run locally

Install Meltano

```sh
# pip
pip install meltano

# pipx
pipx install meltano
```

Install Meltano plugins

```sh
meltano install
```

Run the sync

```sh
# select and mapper obfuscation
meltano run tap-salesforce salesforce-obfuscate-sensitive-data target-postgres

# select obfuscation only
meltano run tap-salesforce target-postgres
```

## Run with Docker

Build image

```sh
docker build -t salesforce-to-postgres .
```

Run the sync

```sh
# select and mapper obfuscation
docker run --rm --env-file .env salesforce-to-postgres

# select obfuscation only
docker run --rm --env-file .env salesforce-to-postgres tap-salesforce target-snowflake
```
