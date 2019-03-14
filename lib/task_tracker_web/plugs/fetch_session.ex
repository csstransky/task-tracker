defmodule TaskTrackerWeb.Plugs.FetchSession do
  import Plug.Conn

  def init(args), do: args

  def call(conn, _args) do
    user = TaskTracker.Users.get_user(get_session(conn, :user_id) || -1)
    if user do
      conn
      |> assign(:current_user, user)
      |> assign(:current_manager, nil)
    else
      manager = TaskTracker.Managers.get_manager(get_session(conn, :manager_id) || -1)
      if manager do
        conn
        |> assign(:current_user, nil)
        |> assign(:current_manager, manager)
      else
        conn
        |> assign(:current_user, nil)
        |> assign(:current_manager, nil)
      end
    end
  end

  def get_name(user, manager) do
    cond do
      user ->
        user.name;
      manager ->
        manager.name;
      true ->
        nil
    end
  end
end
