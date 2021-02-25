defmodule RocketPay do
  alias RocketPay.User.Create, as: UserCreate

  alias RocketPay.Account.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
