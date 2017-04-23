defmodule ImageSharing.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :filename, :string
      timestamps()
    end
  end
end
