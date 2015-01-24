Salon
========

by Matthew Terrill

Salon was developed for salon owners to track their stylists and their stylist's clients.

Installation
------------

Install salon by first cloning the repository.  
```
$ git clone http://github.com/meterrill/salon
```

Install all of the required gems:
```
$ bundle install
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

Database created with PostgreSQL
--------------------------------

Create the database:

``` sql
CREATE DATABASE salon;
```

Connect to the database:

```
\c salon
```

create the following tables:

``` sql
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
```
To create the test database:

``` sql
CREATE DATABASE salon_test WITH TEMPLATE salon;
```

Contribute
----------

- Issue Tracker: github.com/meterrill/salon/issues
- Source Code: github.com/meterrill/salon

Support
-------

If you are having issues, please let me know at: meterrill@gmail.com

Bug reports
===========

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help us fixing the possible bug. We also encourage you to help even more by forking and sending us a pull request.

https://github.com/meterrill/repository/issues

License
=======

MIT License. Copyright 2014 Matthew Terrill
