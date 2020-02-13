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
