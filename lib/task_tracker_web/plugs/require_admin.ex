defmodule TaskTrackerWeb.Plugs.RequireManager do
  use TaskTrackerWeb, :controller

  def init(args), do: args

  def call(conn, _params) do
    user = conn.assigns[:current_user]
    if user.manager do
      conn
    else
      conn
      |> put_flash(:error, "You can't do that.")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt
    end
  end
end
