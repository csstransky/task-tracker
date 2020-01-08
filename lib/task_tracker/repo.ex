defmodule TaskTracker.Repo do
  use Ecto.Repo,
    otp_app: :task_tracker2,
    adapter: Ecto.Adapters.Postgres
end
