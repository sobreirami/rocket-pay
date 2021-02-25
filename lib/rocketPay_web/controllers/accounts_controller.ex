defmodule RocketPayWeb.AccountsController do
  use RocketPayWeb, :controller

  alias RocketPay.Account

  action_fallback RocketPayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- RocketPay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

end
