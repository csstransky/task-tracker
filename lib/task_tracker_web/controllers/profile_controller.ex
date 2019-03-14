defmodule TaskTrackerWeb.ProfileController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Users
  alias TaskTrackerWeb.UserController
  alias TaskTrackerWeb.ManagerController

  def index(conn, _params) do
    cond do
      conn.assigns.current_user ->
        user_id = conn.assigns.current_user.id
        UserController.profile(conn, %{"id" => user_id})
      conn.assigns.current_manager ->
        manager_id = conn.assigns.current_manager.id
        ManagerController.profile(conn, %{"id" => manager_id})
      true ->
        # TODO: Maybe have a different default reaction here, maybe?
        users = Users.list_users()
        UserController.render(conn, "index.html", users: users)
    end
  end
end
