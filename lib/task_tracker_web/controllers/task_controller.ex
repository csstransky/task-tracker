defmodule TaskTrackerWeb.TaskController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Tasks
  alias TaskTracker.Tasks.Task
  alias TaskTracker.Users

  def null_user() do
    %{
      id: nil,
      name: "",
    }
  end

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    user = conn.assigns.current_user
    if user do
      user_list = [null_user] ++ Users.list_manager_underlings(user.id) ++ [user]
      render(conn, "new.html", task: nil, changeset: changeset,
        list_users: user_list)
    else
      render(conn, "new.html", task: nil, changeset: changeset,
        list_users: [null_user])
    end
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset,
          list_users: Users.list_users())
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    time_blocks = TaskTracker.TimeBlocks.list_task_time_blocks(id)
    render(conn, "show.html", task: task, time_blocks: time_blocks)
  end

  def edit(conn, %{"id" => id}) do

    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset,
      list_users: Users.list_users())
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset,
          list_users: Users.list_users())
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
