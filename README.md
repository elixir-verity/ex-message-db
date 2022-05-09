# Message DB

For more information about **Message DB**, see: https://github.com/message-db.

This is a set of tasks to install Message DB from source. Inspired by the other language-specific
packages such as https://github.com/message-db/ruby-gem.

## Installation

```elixir
def deps do
  [
    {:message_db, "~> 0.0", github: "nicholasjhenry/ex-message-db"}
  ]
end
```
## Usage

Clone the message-db source (recommended to be located as a sibling to your application):

    git clone https://github.com/message-db/message-db.git

Sym-link database scripts (in your application):

    mix message_db.symlink_database_scripts --home $PWD/..

Verify symlink:

    ls priv/database/

Install Message DB:

    PGUSER=postgres PGPASSWORD=postgres PGHOST=localhost mix message_db.create_db

Delete Message DB:

    PGUSER=postgres PGPASSWORD=postgres PGHOST=localhost mix message_db.delete_db

## Message DB Scripts

    DATABASE_USER=postgres PGPASSWORD=postgres PGHOST=localhost priv/database/print-messages.sh

## Common Issues

You cannot create users/roles on Heroku therefore the following functions and scripts will fail
to execute, they need to be removed in `install.sh`:

* `create-user`; actually creates a role
* `install-privileges`; otherwise `ERROR:  role "message_store" does not exist`

For more info on the user role, see: https://github.com/message-db/message-db#userrole.
