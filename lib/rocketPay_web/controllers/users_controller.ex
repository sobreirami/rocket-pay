defmodule RocketPayWeb.UsersController do
  use RocketPayWeb, :controller

  alias RocketPay.User

  def create(conn, params) do
    params
    |> RocketPay.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketPayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
