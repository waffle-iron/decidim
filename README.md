[![Stories in Ready](https://badge.waffle.io/AjuntamentdeBarcelona/decidim.png?label=ready&title=Ready)](https://waffle.io/AjuntamentdeBarcelona/decidim)
[![Stories in Ready](https://badge.waffle.io/codegram/decidim.png?label=ready&title=Ready)](https://waffle.io/codegram/decidim)
# Decidim

[![Gem Version](https://badge.fury.io/rb/decidim.svg)](https://badge.fury.io/rb/decidim)
[![Code Climate](https://codeclimate.com/github/codegram/decidim/badges/gpa.svg)](https://codeclimate.com/github/codegram/decidim/trends)
[![Issue Count](https://codeclimate.com/github/codegram/decidim/badges/issue_count.svg)](https://codeclimate.com/github/codegram/decidim/issues)
[![Build Status](https://travis-ci.org/codegram/decidim.svg?branch=master)](https://travis-ci.org/codegram/decidim)
[![codecov](https://codecov.io/gh/codegram/decidim/branch/master/graph/badge.svg)](https://codecov.io/gh/codegram/decidim)
[![Issue Stats](http://issuestats.com/github/codegram/decidim/badge/pr?style=flat)](http://issuestats.com/github/codegram/decidim)
[![Issue Stats](http://issuestats.com/github/codegram/decidim/badge/issue?style=flat)](http://issuestats.com/github/codegram/decidim)


## Requirements

* Ruby 2.3.1
* PostgreSQL 9.5 or newer with the `hstore` extension (should already be installed by default)
* Redis (only in production), required by Rails 5's `ActionCable`

## Installation instructions

First of all, you need to install the `decidim` gem, which currently is in a *prerelease* status.

```
$ gem install decidim decidim-core --pre
```

Afterwards, you can create an application with the nice `decidim` executable:

```
$ decidim decidim_application
$ cd decidim_application
```

**Note**: *These steps will be replaced by a simple `gem install decidim && decidim decidim_application` once the gem is released.*

You should now setup your database:

```
$ rails db:setup
```

This will also create some default data so you can start testing the app:

* A `Decidim::System::Admin` with email `system@decidim.org` and password
 `decidim123456`, to log in at `/system`.
* A `Decidim::Organization` named `Decidim Staging`. You probably want to
  change its name and hostname to match your needs.
* A `Decidim::User` acting as an admin for the organization, with email
 `admin@decidim.org` and password `decidim123456`
* A `Decidim::User` that also belongs to the organization but it's a regular
  user.

This data won't be created in production environments, if you still want to do it, run:

```
$ SEED=true rails db:setup
```

You can now start your server!

```
$ rails s
```

## Upgrade instructions

```
$ bundle update decidim
```

And don't forget to run the upgrade script:

```
$ rails decidim:upgrade
```

If new migrations appear, remember to:

```
$ rails db:migrate
```

## Docker instructions

You can use Docker instead of installing the gems yourself. Run `docker-compose build` and then you can generate a new decidim application using `docker-compose run --rm decidim bundle exec bin/decidim <app-name>`.

Also you can run it as a standalone container like this:
`docker run --rm codegram/decidim bundle exec bin/decidim <app-name>`.

## Notes

* You can use your own application layout - hooks have automatically been installed.
* You can append your own `js` and `css`, files have automatically been replaced.
