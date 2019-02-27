defmodule TaskTracker.CartsTest do
  use TaskTracker.DataCase

  alias TaskTracker.Carts

  describe "cart_items" do
    alias TaskTracker.Carts.CartItem

    @valid_attrs %{count: 42}
    @update_attrs %{count: 43}
    @invalid_attrs %{count: nil}

    def cart_item_fixture(attrs \\ %{}) do
      {:ok, cart_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Carts.create_cart_item()

      cart_item
    end

    test "list_cart_items/0 returns all cart_items" do
      cart_item = cart_item_fixture()
      assert Carts.list_cart_items() == [cart_item]
    end

    test "get_cart_item!/1 returns the cart_item with given id" do
      cart_item = cart_item_fixture()
      assert Carts.get_cart_item!(cart_item.id) == cart_item
    end

    test "create_cart_item/1 with valid data creates a cart_item" do
      assert {:ok, %CartItem{} = cart_item} = Carts.create_cart_item(@valid_attrs)
      assert cart_item.count == 42
    end

    test "create_cart_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Carts.create_cart_item(@invalid_attrs)
    end

    test "update_cart_item/2 with valid data updates the cart_item" do
      cart_item = cart_item_fixture()
      assert {:ok, %CartItem{} = cart_item} = Carts.update_cart_item(cart_item, @update_attrs)

      
      assert cart_item.count == 43
    end

    test "update_cart_item/2 with invalid data returns error changeset" do
      cart_item = cart_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Carts.update_cart_item(cart_item, @invalid_attrs)
      assert cart_item == Carts.get_cart_item!(cart_item.id)
    end

    test "delete_cart_item/1 deletes the cart_item" do
      cart_item = cart_item_fixture()
      assert {:ok, %CartItem{}} = Carts.delete_cart_item(cart_item)
      assert_raise Ecto.NoResultsError, fn -> Carts.get_cart_item!(cart_item.id) end
    end

    test "change_cart_item/1 returns a cart_item changeset" do
      cart_item = cart_item_fixture()
      assert %Ecto.Changeset{} = Carts.change_cart_item(cart_item)
    end
  end
end
