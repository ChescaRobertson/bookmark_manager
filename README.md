# Bookmark Manager

## User Stories
```
As a user
So that I can access my favourite sites quickly
I want to see a list of my bookmarks
```
```
As a user
So I can store bookmarks to use later
I want to add a bookmark to Bookmark Manager
```

## Domain Model


## How to Use

### To set up the project
Clone this repository and then run:
```
bundle
```

### To set up the databases:
Connect to `psql` and create the `bookmark_manager` database  
```
CREATE DATABASE bookmark_manager;
\c bookmark_manager_test;
```
To set up the table run the SQL script found in `db/migrations` folder: 01_create_bookmarks_table.sql    

To set up the test database:  
Connect to `psql` and create the `bookmark_manager_test` database  
```
CREATE DATABASE bookmark_manager;
\c bookmark_manager_test;
```
To set up the table run the SQL script found in `db/migrations` folder: 02_add_title_to_bookmarks.sql  

### To run the Bookmark Manager app

```
rackup -p 3000
```

To view bookmarks, navigate to `localhost:3000/bookmarks`.

### To run tests:
```
rspec
```

### To run linting:
```
rubocop
```