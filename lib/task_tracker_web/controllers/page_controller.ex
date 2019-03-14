defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  def index(conn, _params) do
    cond do
      conn.assigns.current_user ->
        user = conn.assigns.current_user
        user_tasks = TaskTracker.Tasks.list_user_tasks(user.id)
        render(conn, "index.html", user_tasks: user_tasks)
      conn.assigns.current_manager ->
        manager = conn.assigns.current_manager
        manager_underlings = TaskTracker.Users.list_manager_underlings(manager.id)
        render(conn, "index.html", manager_underlings: manager_underlings)
      true ->
        render conn, "index.html"
    end
  end
end
