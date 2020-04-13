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
    user = Repo.get!(User, id)

    json(conn, %{name: user.name, id: user.id})
  end

  def update(conn, %{"id" => id} = params) do
    user = Repo.get!(User, id)

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
    user = Repo.get!(User, id)

    Repo.delete(user)
    json(conn, %{})
  end
end
