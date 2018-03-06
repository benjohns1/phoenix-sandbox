# HelloPhx
Sample app from the Phoenix 1.3 Guides

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## New Phoenix App Cheat Sheet

  1. `mix phx.new <appname>`
  1. `cd <appname>`
  1. # configure database in config/dev.exs
  1. `mix ecto.create`
  1. `mix phx.server` # start server
  1. `iex -S mix phx.server` # start server in IEx
