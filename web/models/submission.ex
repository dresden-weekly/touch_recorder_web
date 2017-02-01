defmodule TouchRecorderWeb.Submission do
  use TouchRecorderWeb.Web, :model

  schema "submissions" do
    field :author, :string
    field :challenge_id, :integer
    field :archive, {:array, :map}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :challenge_id, :archive])
    |> validate_required([:author, :challenge_id, :archive])
  end
end
