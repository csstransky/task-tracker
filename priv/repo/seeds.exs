# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker.Repo.insert!(%TaskTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TaskTracker.Repo
alias TaskTracker.Users.User

Repo.insert!(%User{email: "alice@example.com", admin: true})
Repo.insert!(%User{email: "bob@example.com", admin: false})

alias TaskTracker.Products.Product
Repo.insert!(%Product{name: "Rubber Duck", desc: "Yellow",
                      price: Decimal.new("4.99"), inventory: 5})
Repo.insert!(%Product{name: "Bear", desc: "500lbs; angry",
                      price: Decimal.new("44.99"), inventory: 2})

