defmodule TaskTrackerWeb.SessionController do
  use TaskTrackerWeb, :controller

  def create(conn, %{"name" => name}) do
    user = TaskTracker.Users.get_user_by_name(name)
    manager = TaskTracker.Managers.get_manager_by_name(name)
    cond do
      user ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Welcome back #{user.name}")
        |> redirect(to: Routes.page_path(conn, :index))
      manager ->
        conn
        |> put_session(:manager_id, manager.id)
        |> put_flash(:info, "Welcome back #{manager.name}")
        |> redirect(to: Routes.page_path(conn, :index))
      true ->
        conn
        |> put_flash(:error, "Login failed.")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> delete_session(:manager_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
