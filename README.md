# SQL Demo

This project is a demonstration of SQL database operations.

## Features

- Connect to a database
- Create tables and schemas
- Insert, update, and delete data
- Perform queries and retrieve results

## Prerequisites

Docker installed or MySQL server installed.

If you're using Docker, run this command to start the server.

```shell
docker run --name mysql -d \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=root \
    --restart unless-stopped \
    mysql:8
```

This will start the MySQL server in the background.

To enter the MySQL client, use this command.

```shell
docker exec -it mysql mysql -p
```

Then type the password you added in the previous command (i.e. `root`) and press enter.

## Usage

First run the `db.sql` commands to create the database and tables.
Then try different commands mentioned in the below files.
* `1.create.sql`
* `2.retrieve.sql`
* `3.update.sql`
* `4.delete.sql`