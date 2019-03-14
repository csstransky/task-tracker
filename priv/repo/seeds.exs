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
alias TaskTracker.Managers
alias TaskTracker.Managers.Manager

Repo.insert!(%Manager{name: "charles"})
Repo.insert!(%User{name: "alice", manager: Managers.get_manager_by_name("charles")})
Repo.insert!(%User{name: "bob"})
Repo.insert!(%Task{title: "Do the thing.", desc: "It must be done.", complete: false,
              time: Decimal.new("1.5"), user: Users.get_user_by_name("alice")})
Repo.insert!(%Task{title: "Test Task", desc: "Should Work", complete: true,
              user: Users.get_user_by_name("bob"), time: 1})
