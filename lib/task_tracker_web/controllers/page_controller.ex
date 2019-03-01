defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  def index(conn, _params) do
    if conn.assigns.current_user do
      #user_id = TaskTracker.Users.get_user_by_name(conn.assigns.current_user)
      #user_tasks = TaskTracker.Tasks.list_tasks
      #render(conn, "index.html", user_tasks: user_tasks)
      render conn, "index.html"
    else
      render conn, "index.html"
    end
  end
end
