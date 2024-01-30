# Walkthrough

## Setting up IDAM Simulator

* Download the [rse-idam-simulator](https://github.com/hmcts/rse-idam-simulator).
* Checkout the branch `update-user-endpoint`

> This is a temporary solution until the branch `update-user-endpoint` is merged into master

### Build the IDAM Simulator project

* Open a terminal and navigate to the root of the IDAM simulator project.

If you have Gradle installed locally:

```bash
./gradlew clean build
```

else use the docker image:

``` bash
docker run -i -v "$(pwd)":/home/gradle/project -w /home/gradle/project --network=host gradle ./gradlew build
```

### Build the IDAM Simulator Docker image

```bash
docker build -t rse-idam-local:latest .
```

## Setup CCD Docker

* Connect to the VPN
* Checkout the `ga-master` branch.
* Open a terminal at the root of the repo and the following commands in order:

```bash
./ccd login

./ccd compose up -d
./bin/add-users.sh
./bin/add-ccd-roles.sh
./bin/add-role-assignments.sh
```

> `./ccd compose pull` does not correctly pull images from the docker registry when pointing to the local IDAM simulator image.
> Check the idam simulator is healthy, and run the `./ccd compose up -d` command again.
>
>  ```bash
> curl http://localhost:5000/health
> ```

## Import the CCD definition

* Open a terminal at the root of the repo and run the following command:

```bash
./bin/ccd-import-definition.sh <absolute file path name of the jurisdiction excel file>
```

> If the command succeeds, you should see a message `Case definition data successfully imported.`
> If the command fails, you make have to delete all containers and volumes and start again.

## Create connections to the databases

* ccd_data
* dbuserprofile
* ccd_definition

| Attribute |   Value    |
| :-------: | :--------: |
|   host    | localhost  |
|   port    |    5050    |
|    db     | <db_name>  |
|   user    |    ccd     |
|    pwd    | Pa55word11 |

## Setup Organisation and User

Before proceeding further, please activate the user `befta.org.1@gmail.com` and update the IDAM ID. See [instructions](../docs/update-user-identifier.md). This needs to be done for every user created.

> Import the postman collection `GA-CCD-Docker.postman_collection.json` into Postman.

1) Create an organisation
2) Activate an organisation
3) Add a user to the organisation
   1) Activate the user
   2) Update the user's IDAM ID

## Running Manage Org locally

* stop the container (xui-manage-org-1)
* update the `local-development.json` file for the manage org app. (Copy the config from `docs/assets/xui-mo-docker.json`)
