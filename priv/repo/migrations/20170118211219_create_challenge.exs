defmodule TouchRecorderWeb.Repo.Migrations.CreateChallenge do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :name, :string
      add :details, :string
      add :description_set, {:array, :string}

      timestamps()
    end

  end
end
