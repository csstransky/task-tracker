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
alias TaskTracker.Users
alias TaskTracker.Tasks.Task

Repo.insert!(%User{name: "alice", admin: true})
Repo.insert!(%User{name: "bob", admin: false})
Repo.insert!(%Task{title: "Do the thing.", desc: "It must be done.", complete: false,
              time: Decimal.new("1.5"), user: Users.get_user_by_name("alice")})
Repo.insert!(%Task{title: "Test Task", desc: "Should Work", complete: true,
              user: Users.get_user_by_name("bob"), time: 1})
