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
alias TaskTracker.Tasks
alias TaskTracker.TimeBlocks.TimeBlock

Repo.insert!(%User{name: "charles", admin: false})
Repo.insert!(%User{name: "alice", admin: true, manager: Users.get_user_by_name("charles")})
Repo.insert!(%User{name: "bob", admin: false, manager: Users.get_user_by_name("charles")})
Repo.insert!(%Task{title: "Do the thing.", desc: "It must be done.", complete: false,
              time: Decimal.new("1.5"), user: Users.get_user_by_name("alice")})
Repo.insert!(%Task{title: "Test Task", desc: "Should Work", complete: true,
              user: Users.get_user_by_name("bob"), time: 1})
Repo.insert!(%TimeBlock{time_start: ~N[2019-03-12 17:00:00], time_end: ~N[2019-03-14 17:59:30],
  task: Tasks.get_task_by_title("Do the thing.")})
  Repo.insert!(%TimeBlock{time_start: ~N[2019-03-13 17:00:00], time_end: ~N[2019-03-14 17:59:30],
    task: Tasks.get_task_by_title("Test Task")})
