defmodule TaskTrackerWeb.CartItemController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Carts
  alias TaskTracker.Carts.CartItem

  def index(conn, _params) do
    cart_items = Carts.list_cart_items()
    render(conn, "index.html", cart_items: cart_items)
  end

  def new(conn, _params) do
    changeset = Carts.change_cart_item(%CartItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cart_item" => cart_item_params}) do
    case Carts.create_cart_item(cart_item_params) do
      {:ok, cart_item} ->
        conn
        |> put_flash(:info, "Cart item created successfully.")
        |> redirect(to: Routes.product_path(conn, :show, cart_item.product_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cart_item = Carts.get_cart_item!(id)
    render(conn, "show.html", cart_item: cart_item)
  end

  def edit(conn, %{"id" => id}) do
    cart_item = Carts.get_cart_item!(id)
    changeset = Carts.change_cart_item(cart_item)
    render(conn, "edit.html", cart_item: cart_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cart_item" => cart_item_params}) do
    cart_item = Carts.get_cart_item!(id)

    case Carts.update_cart_item(cart_item, cart_item_params) do
      {:ok, cart_item} ->
        conn
        |> put_flash(:info, "Cart item updated successfully.")
        |> redirect(to: Routes.product_path(conn, :show, cart_item.product_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cart_item: cart_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart_item = Carts.get_cart_item!(id)
    {:ok, _cart_item} = Carts.delete_cart_item(cart_item)

    conn
    |> put_flash(:info, "Cart item deleted successfully.")
    |> redirect(to: Routes.product_path(conn, :show, cart_item.product_id))
  end
end
