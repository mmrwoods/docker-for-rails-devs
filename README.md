# Docker for Rails Developers

Working through the book, using Rails 6 rather than Rails 5.

See https://pragprog.com/book/ridocker/docker-for-rails-developers

## Notes

### Chapter 1

If the parent directory of the new rails application is a git repo, you might
want to add `--skip-git` when generating the new rails application, or run `rm
-rf myapp/.git` after generating the new rails application with a git repo.

Rails 6 uses Webpacker as the default JavaScript compiler. When enabled, this
requires installing Yarn and running `rails webpacker:install` before Rails can
boot. The easiest thing to do here is use the `--skip-javascript` option when
creating the new Rails app, and then follow the instructions for adding
Webpacker in Chapter 7.

### Chapter 2

If you have not created the new Rails app with the `--skip-javascript` option,
you'll need to update the `Dockerfile` to install Yarn and then run `rails
webpacker:install` via `docker run` to install and configure Webpacker. There
is more information about the `Dockerfile` changes required in Chapter 7.

### Chapter 6

Do not use a password longer than 100 bytes for Postgres, the Postgres client
programs will truncate the password to the first 100 bytes, but ActiveRecord
will not, leading to successful connections from psql, but PG::ConnectionBad
(FATAL: password authentication failed for user "postgres") errors from Rails.

See https://www.postgresql.org/message-id/flat/E1Rqxp2-0004Qt-PL%40wrigleys.postgresql.org \
And https://github.com/docker-library/postgres/issues/507

If you get stuck on this, seemingly unable to get beyond "PG::ConnectionBad:
FATAL: password authentication failed for user postgres", try shutting down
all compose services, pruning stopped containers and then force recreating.

```
docker-compose down
docker container prune
docker-compose up --force-recreate
```

This will force the web and database containers to be re-created, and a new
postgres database to initialized, hopefully with a password which will work.

Note: simply using `docker-compose up --force-recreate` did not work for me,
as postgres would find and re-use an existing database, I had to stop, prune
and recreate to force postgres to re-initialize and recreate the database.
