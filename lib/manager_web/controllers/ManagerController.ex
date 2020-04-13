defmodule ManagerWeb.ManagerController do
  use ManagerWeb, :controller

  alias Manager.{User, Repo}

  def create(conn, params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, %{id: id, name: name}} ->
        json(conn, %{name: name, id: id})

      {:error, %Ecto.Changeset{} = changeset} ->
        json(conn, changeset)
    end
  end

  def index(conn, %{"id" => id}) do
    user =
      case Repo.get(User, id) do
        nil ->
          conn
          |> put_status(400)
          |> json(%{error: "user not found!"})

        user ->
          user
      end

    json(conn, %{name: user.name})
  end

  def update(conn, %{"id" => id} = params) do
    user =
      case Repo.get(User, id) do
        nil ->
          conn
          |> put_status(400)
          |> json(%{error: "user not found!"})

        user ->
          user
      end

    user
    |> User.changeset(params)
    |> Repo.update()
    |> case do
      {:ok, %{id: id, name: name}} ->
        json(conn, %{name: name, id: id})

      {:error, %Ecto.Changeset{} = changeset} ->
        json(conn, changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user =
      case Repo.get(User, id) do
        nil ->
          conn
          |> put_status(400)
          |> json(%{error: "user not found!"})

        user ->
          user
      end

    Repo.delete(user)
    json(conn, %{})
  end
end
