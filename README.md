# Docker for Rails Developers

Working through the book, using Rails 6 rather than Rails 5.

See https://pragprog.com/book/ridocker/docker-for-rails-developers

## Notes

### Chapter 1

If the parent directory of the new rails application is a git repo, you might
want to add `--skip-git` when generating the new rails application, or run `rm
-rf myapp/.git` after generating the new rails application with a git repo.

### Chapter 2

Rails 6 uses Webpacker as the default JavaScript compiler, which requires
changes to the `Dockerfile` to install Yarn and run `rails webpacker:install`
