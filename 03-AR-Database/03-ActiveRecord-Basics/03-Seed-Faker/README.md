## Background & Objectives

Now you are OK with both migrations and models, we'll put ourselves in a real-life scenario
We want to have a dataset with which we can bootstrap our database. It's called a `seed`.

## Setup

We will use the [faker](https://github.com/stympy/faker) gem to generate `Post` attributes.
 But first you have to install it on your laptop:

```bash
$ gem install faker
```

Here is a useful command to drop your database, recreate it, migrate the schema and seed it.
That'll save you a lot of time while developing your seed.

```bash
$ rake db:drop db:create db:migrate db:seed
```

Look at your rows inserted with the `rake db:seed`:

```bash
$ sqlite3 db/development.sqlite3
sqlite> .mode columns
sqlite> .headers on
sqlite> SELECT * FROM posts;
```

## Specs

Open the `db/seeds.rb` file and write some code to insert 100 posts, using
fake data generated by the `faker` gem.