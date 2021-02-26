defmodule RocketPayWeb.AccountsController do
  use RocketPayWeb, :controller

  alias RocketPay.Account
  alias RocketPay.Accounts.Transaction.Response, as: TransactionResponse

  action_fallback RocketPayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- RocketPay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- RocketPay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- RocketPay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end

end
