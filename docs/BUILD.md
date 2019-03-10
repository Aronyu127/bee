Project Build
===============

- make sure you have already start PostgreSql

```
bundle install
```

```
cp .env.example .env
```
- set env on .env file

- setup database.yml & start postgresql.

```
bundle exec rails db:create
bundle exec rails db:migrate
```

PostgreSql
=================

- install

```
brew install postgresql
brew unlink postgresql
brew link postgresql
ARCHFLAGS="-arch x86_64" gem install pg
```

- goto http://postgresapp.com/ download and start it.

- setup user & password

```
psql
```

- replace your_password

```
CREATE USER ifuntuan WITH PASSWORD 'your_password';
CREATE DATABASE "ifuntuan";
GRANT ALL PRIVILEGES ON DATABASE ifuntuan to ifuntuan;
ALTER USER ifuntuan WITH SUPERUSER;
```
