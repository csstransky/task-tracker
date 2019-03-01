defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  def index(conn, _params) do
    if conn.assigns.current_user do
      user = conn.assigns.current_user
      user_tasks = TaskTracker.Tasks.list_user_tasks(user.id)
      render(conn, "index.html", user_tasks: user_tasks)
    else
      render conn, "index.html"
    end
  end
end
