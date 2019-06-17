# pgxtestdb

Toolset for building Docker image with Postgres, suitable for testing [github.com/jackc/pgx](https://github.com/jackc/pgx) driver.

## Usage

* `make` - to start database (in container) listening `0.0.0.0:5432`.
* `make clear` - to stop and remove container.