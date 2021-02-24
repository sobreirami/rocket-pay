defmodule RocketPay do
  alias RocketPay.User.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
