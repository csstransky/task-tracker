defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  def index(conn, _params) do
    if conn.assigns.current_user do
      user = conn.assigns.current_user
      user_tasks = TaskTracker.Tasks.list_user_tasks(user.id)
      manager_underlings = TaskTracker.Users.list_manager_underlings(user.id)
      # I do this to save the HTML from having to use any real logic
      user_tasks = if length(user_tasks) > 0, do: user_tasks, else: nil
      manager_underlings = if length(manager_underlings) > 0,
        do: manager_underlings,
        else: nil
      render(conn, "index.html", user_tasks: user_tasks,
        manager_underlings: manager_underlings)
    else
      render conn, "index.html"
    end
  end
end
