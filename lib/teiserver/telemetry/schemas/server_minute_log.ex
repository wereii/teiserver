defmodule Teiserver.Telemetry.ServerMinuteLog do
  use CentralWeb, :schema

  @primary_key false
  schema "teiserver_server_minute_logs" do
    field :timestamp, :utc_datetime, primary_key: true
    field :data, :map
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @spec changeset(Map.t(), Map.t()) :: Ecto.Changeset.t()
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:timestamp, :data])
    |> validate_required([:timestamp, :data])
  end

  @spec authorize(atom, Plug.Conn.t(), Map.t()) :: boolean
  def authorize(_action, conn, _params), do: allow?(conn, "Server")
end
