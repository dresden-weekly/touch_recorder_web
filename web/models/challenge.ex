defmodule TouchRecorderWeb.Challenge do
  use TouchRecorderWeb.Web, :model

  schema "challenges" do
    field :name, :string
    field :details, :string
    field :description_set, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :details, :description_set])
    |> validate_required([:name, :details, :description_set])
  end
end
