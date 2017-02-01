defmodule TouchRecorderWeb.Repo.Migrations.CreateSubmission do
  use Ecto.Migration

  def change do
    create table(:submissions) do
      add :author, :string
      add :challenge_id, :integer
      add :archive, :map

      timestamps()
    end

  end
end
