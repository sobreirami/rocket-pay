defmodule RocketPay.User.Create do
    alias RocketPay.{Repo, User}

    def call(params) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
end
