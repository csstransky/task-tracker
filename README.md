# Task Tracker  
Uses Elixir and Ecto (with PostgreSQL) to assign, create, and delete users and
tasks to a local database, all in an integrated web format. The UI is mainly
comprised of Bootstrap.

### Design Choices
+ Managers are simply Users with people under them.
+ All Manager backend must be done by a database admin, the website has no way
to assign users to the managers. This was done to avoid users to be assigned to
each other by people without privileges. In a future release, a user with an
"admin" flag would be able to assign users to others.
+ Tasks can be created by everyone, including people not logged in, BUT you can
only assign them to either yourself, no one, or your underlings.
+ Time blocks can be added dynamically to Tasks by looking at them from the
"Show" section and using the Active Timer feature. The Active Timer needs to
first have a start time in order for it to work correctly.
+ Time blocks can be dynamically edited right on the Task show page.

## Demo

Use the task tracker here: [hw08.cstransky.com](http://hw08.cstransky.com).

### Phoenix Local Deployment
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### Note:
Different parts of the codebase forked from Nat Tuck's repo: [here](https://github.com/NatTuck/husky_shop)

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
