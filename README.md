# Client Dashboard

This is part of a code challenge to show the implementation of an excel import.

There are two ways to use the project:

- Running it locally
- Using the deployed heroku page

## Local Setup

These instructions will get you a copy of the project up and running on your local machine.

### Requirements
- Ruby version - 3.0.2
- Rails version - 6.1.4

### Installing

Clone git repository and run bundle install:

```shell
$ git clone git@github.com:sajib-hassan/client_dashboard.git
$ bundle install
```

Set up the database (postgresql must be installed, change the database.yml if necessary):

```shell
$ bin/rails db:create
$ bin/rails db:migrate
```

Run the rails server:

```shell
$ bin/rails s
```

You will have to create some data either by running

```shell
$ bin/rails db:seed
```

or by creating it via the rails console.

### Running the tests

To run the tests execute following statement:

```
$ bin/rake
```

## Demo - Heroku Deployment

It is also possible to use the excel import via Heroku. The project is currently accessible at
[https://x-client-dashboard.herokuapp.com/employees](https://x-client-dashboard.herokuapp.com/employees).

Some test companies and clients are already available there to be able to try out the excel import.

## Authentication

The application is currently being "secured" by a basic authentication with `username` and `secret` as credentials.

## Excel Import

The excel import supports the bulk creation of multiple employees which can be assigned to a company and
optionally to a set of clients. An example for a file is available in the `docs` folder of the project
which works for the heroku page out of the box.

The backend does not care whether there are empty rows in the excel and it does not depend on a specific order
regarding the columns of the excel.

If the excel file adheres to the following properties it will be successfully imported:

- Four columns have to exist: `first name`, `last name`, `company`, `clients`
- Clients are optional, multiple clients can be separated using commas
- Values for `first name`, `last name`, and `company` are required for each employee
- Clients and companies are referenced using the `ctoken` and the `identity`, respectively, and must exist

In case these rules are violated an error will be presented to the user which provides helpful insights to
be able to fix the problem.

# TO-DO
I didn't have extra time to invest on the project, so I had to prioritize the work:

Next steps I would do:
- Add validation that Consultant **must have** either `contractor` or `employee` and not both.
- better implementation: Excel header columns can be mapped with the required fields using user interface. So that, no dependency on the Excel file's column headers.
- better feedback for importer execution: how many were created, errored, etc
- review listing performance and all the joined queries
- add missing tests for models
- add sorting on the table lists
- add filter feature for entities

